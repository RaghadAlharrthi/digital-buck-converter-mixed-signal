`timescale 1ns/1ps
// Testbench for buck_model — apply fixed duty, watch v_out settle
module buck_model_tb;

    reg         clk;
    reg         rst;
    reg  [7:0]  duty;
    reg  [15:0] v_in;
    wire [15:0] v_out;

    buck_model #(.WIDTH(8), .VWIDTH(16)) dut (
        .clk   (clk),
        .rst   (rst),
        .duty  (duty),
        .v_in  (v_in),
        .v_out (v_out)
    );

    // Clock: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("sim/buck.vcd");
        $dumpvars(0, buck_model_tb);

        rst  = 1;
        v_in = 16'd12000;     // 12.000 V
        duty = 8'd64;         // 25% -> target 3000 mV
        #20;
        rst  = 0;

        #4000;                // let v_out rise and settle

        $finish;
    end

endmodule
