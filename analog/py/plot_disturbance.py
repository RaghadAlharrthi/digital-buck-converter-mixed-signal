import numpy as np
import matplotlib.pyplot as plt

# columns: t vout  t vin  t pwm
d = np.loadtxt("disturb_out.txt")
t    = d[:, 0] * 1e3   # ms
vout = d[:, 1]
vin  = d[:, 3]
pwm  = d[:, 5]

# duty = moving average of pwm to show the trend (smooth the switching)
def smooth(x, n=2000):
    return np.convolve(x, np.ones(n)/n, mode="same")
duty = smooth(pwm)

fig, (ax1, ax2, ax3) = plt.subplots(3, 1, figsize=(9, 7), sharex=True)

ax1.plot(t, vin, color="orange")
ax1.set_ylabel("Vin (V)")
ax1.set_title("Input supply sags 12V -> 9V at t=1ms")
ax1.grid(True, alpha=0.3)

ax2.plot(t, vout, color="purple")
ax2.axhline(3.3, color="red", linestyle="--", alpha=0.7, label="target 3.3V")
ax2.set_ylabel("Vout (V)")
ax2.set_ylim(2.8, 3.8)
ax2.set_title("Output stays regulated at 3.3V (disturbance rejected)")
ax2.legend(loc="upper right")
ax2.grid(True, alpha=0.3)

ax3.plot(t, duty, color="green")
ax3.set_ylabel("Duty (avg)")
ax3.set_xlabel("Time (milliseconds)")
ax3.set_title("Duty rises 0.28 -> 0.37 to compensate (matches Verilog 70->94)")
ax3.grid(True, alpha=0.3)

plt.tight_layout()
plt.savefig("disturbance_plot.png", dpi=130)
print("Saved disturbance_plot.png")
