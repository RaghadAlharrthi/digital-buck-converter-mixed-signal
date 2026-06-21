`timescale 1ns/1ps
// Testbench for pwm_generator — steps duty through several values
module pwm_generator_tb;

    reg        clk;
    reg        rst;
    reg  [7:0] duty;
    wire       pwm_out;

    pwm_generator #(.WIDTH(8)) dut (
        .clk     (clk),
        .rst     (rst),
        .duty    (duty),
        .pwm_out (pwm_out)
    );

    // Clock: toggle every 5ns => 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("sim/pwm.vcd");
        $dumpvars(0, pwm_generator_tb);

        rst  = 1;
        duty = 8'd64;      // 25%
        #20;
        rst  = 0;

        #6000;             // run at 25% for a while
        duty = 8'd128;     // step up to 50%
        #6000;             // run at 50%
        duty = 8'd192;     // step up to 75%
        #6000;             // run at 75%

        $finish;
    end

endmodule
