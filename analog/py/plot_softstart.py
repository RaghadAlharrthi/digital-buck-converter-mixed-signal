import numpy as np
import matplotlib.pyplot as plt

hard = np.loadtxt("closed_out.txt")      # original hard-start run
soft = np.loadtxt("softstart_out.txt")   # new soft-start run

th = hard[:, 0] * 1e3
vh = hard[:, 1]
ts = soft[:, 0] * 1e3
vs = soft[:, 1]
vref = soft[:, 3] * 6.6   # scale reference back up to "equivalent Vout target"

plt.figure(figsize=(10, 5.5))
plt.plot(th, vh, color="red", alpha=0.7, linewidth=1.0, label="Hard start (no soft-start)")
plt.plot(ts, vs, color="purple", linewidth=1.3, label="Soft start")
plt.plot(ts, vref, color="green", linestyle=":", linewidth=1.2, label="Soft-start reference (scaled)")
plt.axhline(3.3, color="black", linestyle="--", alpha=0.5, label="target 3.3V")
plt.title("Soft-Start eliminates startup overshoot (7.6V -> 3.3V)")
plt.xlabel("Time (milliseconds)")
plt.ylabel("Vout (V)")
plt.xlim(0, 2.0)
plt.legend(loc="upper right")
plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig("softstart_plot.png", dpi=130)
print("Saved softstart_plot.png")
