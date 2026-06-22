import numpy as np
import matplotlib.pyplot as plt

# columns: time  ramp  (time) ctrl  (time) pwm   -- wrdata repeats time per var
d = np.loadtxt("pwm_out.txt")
t    = d[:, 0] * 1e6   # microseconds
ramp = d[:, 1]
ctrl = d[:, 3]
pwm  = d[:, 5]

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(9, 5), sharex=True)

ax1.plot(t, ramp, color="purple", label="ramp")
ax1.plot(t, ctrl, color="red", linestyle="--", label="control (Vctrl)")
ax1.set_ylabel("Volts")
ax1.set_title("Comparator PWM: pulse is HIGH while ramp < control")
ax1.legend(loc="upper right")
ax1.grid(True, alpha=0.3)

ax2.plot(t, pwm, color="green")
ax2.set_ylabel("PWM out")
ax2.set_xlabel("Time (microseconds)")
ax2.set_ylim(-0.1, 1.1)
ax2.grid(True, alpha=0.3)

plt.tight_layout()
plt.savefig("pwm_plot.png", dpi=130)
print("Saved pwm_plot.png")
