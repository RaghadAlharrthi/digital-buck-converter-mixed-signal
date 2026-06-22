import numpy as np
import matplotlib.pyplot as plt

gains = [20, 80, 300]
colors = {20: "green", 80: "purple", 300: "orange"}

plt.figure(figsize=(10, 5.5))
for g in gains:
    d = np.loadtxt(f"closed_g{g}.txt")
    t = d[:, 0] * 1e3      # ms
    vout = d[:, 1]
    plt.plot(t, vout, color=colors[g], linewidth=1.0, label=f"Again = {g}")

plt.axhline(3.3, color="red", linestyle="--", alpha=0.7, label="target 3.3V")
plt.title("Gain vs. Damping Trade-off: closed-loop startup at three gains")
plt.xlabel("Time (milliseconds)")
plt.ylabel("Vout (V)")
plt.xlim(0, 1.0)   # zoom into the interesting first 1ms
plt.legend(loc="upper right")
plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig("gain_sweep_plot.png", dpi=130)
print("Saved gain_sweep_plot.png")
