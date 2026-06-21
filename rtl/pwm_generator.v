// PWM Generator: converts a duty-cycle value into an ON/OFF switching signal
module pwm_generator #(
    parameter WIDTH = 8          // counter width: 8 bits => sweeps 0..255
)(
    input  wire              clk,      // clock: drives the counter
    input  wire              rst,      // synchronous reset: clears counter to 0
    input  wire [WIDTH-1:0]  duty,     // duty threshold (the "command")
    output wire              pwm_out   // the ON/OFF switching output
);

    reg [WIDTH-1:0] counter;           // the sweeping counter

    // On every rising clock edge: count up, or reset to 0
    always @(posedge clk) begin
        if (rst)
            counter <= 0;
        else
            counter <= counter + 1'b1; // wraps automatically at max (256 -> 0)
    end

    // Output is ON (1) while counter is below the duty threshold
    assign pwm_out = (counter < duty);

endmodule
