import numpy as np
import matplotlib.pyplot as plt

# columns: time  vout  (time) ctrl
d = np.loadtxt("closed_out.txt")
t    = d[:, 0] * 1e3   # milliseconds
vout = d[:, 1]
ctrl = d[:, 3]

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(9, 6), sharex=True)

ax1.plot(t, vout, color="purple", linewidth=1.0)
ax1.axhline(3.3, color="red", linestyle="--", alpha=0.7, label="target 3.3V")
ax1.set_ylabel("Vout (V)")
ax1.set_title("Closed-Loop Startup: output finds and holds 3.3V")
ax1.legend(loc="lower right")
ax1.grid(True, alpha=0.3)

ax2.plot(t, ctrl, color="green", linewidth=1.0)
ax2.set_ylabel("Control voltage (V)")
ax2.set_xlabel("Time (milliseconds)")
ax2.set_title("Error amplifier output (the loop's duty command)")
ax2.grid(True, alpha=0.3)

plt.tight_layout()
plt.savefig("closed_loop_plot.png", dpi=130)
print("Saved closed_loop_plot.png")
