# Digital Buck Converter Controller (Verilog)

A closed-loop digital PWM-based controller for a buck converter, written in Verilog and verified with iverilog + GTKWave. The design regulates output voltage to a target and recovers from supply-voltage disturbances.

## What it does

A digital PI controller senses the converter's output voltage, compares it to a reference, and adjusts a duty-cycle command to hold the output steady, even when the input supply changes under it.

## Architecture

The loop: v_ref goes into the PI controller, which outputs a duty command to the buck model, which produces v_out. v_out is fed back to the PI controller, closing the loop.

| Block | File | Role |
|-------|------|------|
| PWM generator | rtl/pwm_generator.v | Converts a duty value into an ON/OFF switching signal |
| Buck model | rtl/buck_model.v | Behavioral L-C plant; output voltage chases duty x V_in |
| PI controller | rtl/pi_controller.v | Computes duty from voltage error; integral term removes steady-state error |
| Top level | rtl/buck_top.v | Closes the feedback loop |

## Verification results

- Regulation: output settles to the 3300 mV (3.3 V) target, with the integral term eliminating steady-state error.
- Disturbance rejection: when the supply sags from 12 V to 9 V mid-simulation, the controller raises duty from about 70 to about 94 and restores the output to 3.3 V, matching the hand prediction 3300/9000 x 256 = ~94.

## How to run

Compile and run the closed-loop test:

    iverilog -o sim/buck_top_sim rtl/buck_top.v rtl/pi_controller.v rtl/buck_model.v tb/buck_top_tb.v
    vvp sim/buck_top_sim
    gtkwave sim/buck_top.vcd

Individual blocks have their own testbenches in tb/.

## Tools

iverilog (simulation), GTKWave (waveform viewing), Verilog-2001.

## Waveform

![Closed-loop regulation and disturbance recovery](images/regulation.png)

The controller holds v_out at the 3.3 V target, rejects a 12 V to 9 V supply disturbance, and raises duty from ~70 to ~94 to restore regulation.
