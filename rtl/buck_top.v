// Top-level closed-loop: PI controller + buck model in feedback
module buck_top #(
    parameter VWIDTH = 16,
    parameter WIDTH  = 8
)(
    input  wire                     clk,
    input  wire                     rst,
    input  wire signed [VWIDTH-1:0] v_ref,
    input  wire        [VWIDTH-1:0] v_in,
    output wire        [VWIDTH-1:0] v_out,
    output wire        [WIDTH-1:0]  duty
);
    pi_controller #(.VWIDTH(VWIDTH), .WIDTH(WIDTH)) pi (
        .clk   (clk),
        .rst   (rst),
        .v_ref (v_ref),
        .v_out ($signed(v_out)),
        .duty  (duty)
    );
    buck_model #(.WIDTH(WIDTH), .VWIDTH(VWIDTH)) buck (
        .clk   (clk),
        .rst   (rst),
        .duty  (duty),
        .v_in  (v_in),
        .v_out (v_out)
    );
endmodule
