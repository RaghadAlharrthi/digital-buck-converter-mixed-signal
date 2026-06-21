`timescale 1ns/1ps
// Closed-loop testbench: prove v_out regulates to v_ref despite a disturbance
module buck_top_tb;

    reg                 clk;
    reg                 rst;
    reg  signed [15:0]  v_ref;
    reg         [15:0]  v_in;
    wire        [15:0]  v_out;
    wire        [7:0]   duty;

    buck_top #(.VWIDTH(16), .WIDTH(8)) dut (
        .clk   (clk),
        .rst   (rst),
        .v_ref (v_ref),
        .v_in  (v_in),
        .v_out (v_out),
        .duty  (duty)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("sim/buck_top.vcd");
        $dumpvars(0, buck_top_tb);

        rst   = 1;
        v_ref = 16'sd3300;     // target 3.3 V
        v_in  = 16'd12000;     // supply 12 V
        #20;
        rst   = 0;

        #20000;                // let the loop settle at 3300

        v_in  = 16'd9000;      // DISTURBANCE: supply sags to 9 V
        #20000;                // watch v_out recover back to 3300

        $finish;
    end

endmodule
