// PI controller: computes duty from voltage error
// error = v_ref - v_out ; duty = Kp*error + Ki*(integral of error)
module pi_controller #(
    parameter VWIDTH = 16,        // voltage width
    parameter WIDTH  = 8          // duty output width
)(
    input  wire                 clk,
    input  wire                 rst,
    input  wire signed [VWIDTH-1:0] v_ref,   // desired voltage
    input  wire signed [VWIDTH-1:0] v_out,   // measured voltage
    output reg         [WIDTH-1:0]  duty     // duty command (0..255)
);

    // Gains as simple shift factors (powers of two keep it cheap in hardware).
    // effective Kp = 1/16, Ki = 1/256, chosen to be gentle.
    localparam KP_SHIFT = 4;
    localparam KI_SHIFT = 8;

    reg signed [31:0] integral;            // running sum of error
    wire signed [VWIDTH:0] error = v_ref - v_out;   // current error (one extra bit)

    reg signed [31:0] pid_raw;             // raw control value before clamping

    always @(posedge clk) begin
        if (rst) begin
            integral <= 0;
            duty     <= 0;
        end else begin
            // accumulate error for the integral term
            integral <= integral + error;

            // PI formula using shifts instead of multipliers
            pid_raw = (error >>> KP_SHIFT) + (integral >>> KI_SHIFT);

            // clamp pid_raw into the valid duty range 0..255
            if (pid_raw < 0)
                duty <= 0;
            else if (pid_raw > 255)
                duty <= 255;
            else
                duty <= pid_raw[WIDTH-1:0];
        end
    end

endmodule
