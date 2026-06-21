// Behavioral buck converter model (digital approximation)
// V_out gradually chases toward (duty/256) * V_in
module buck_model #(
    parameter WIDTH   = 8,        // duty width
    parameter VWIDTH  = 16        // voltage representation width
)(
    input  wire               clk,
    input  wire               rst,
    input  wire [WIDTH-1:0]   duty,      // duty command from PWM side
    input  wire [VWIDTH-1:0]  v_in,      // input voltage (e.g. millivolts)
    output reg  [VWIDTH-1:0]  v_out      // output voltage (millivolts)
);

    // The "target" voltage this duty would settle to: (duty * v_in) / 256
    wire [31:0] v_target = (duty * v_in) >> 8;   // >>8 divides by 256

    // Each clock, move v_out a fraction of the way toward target.
    // This mimics the gradual L-C filter response (a first-order lag).
    always @(posedge clk) begin
        if (rst)
            v_out <= 0;
        else
            // move 1/16 of the remaining distance toward target each step
            v_out <= v_out + ((v_target - v_out) >>> 4);
    end

endmodule
