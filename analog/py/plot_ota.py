import numpy as np
import matplotlib.pyplot as plt
d = np.loadtxt("ota_sweep.txt")
vfb, out = d[:,0], d[:,1]
plt.figure(figsize=(8,5))
plt.plot(vfb, out, color="purple", linewidth=1.6)
plt.axvline(2.5, color="red", linestyle="--", alpha=0.6, label="vref = 2.5V")
plt.title("Transistor-Level OTA Transfer Curve (5-transistor diff pair)")
plt.xlabel("Feedback voltage vfb (V)")
plt.ylabel("Output (V)")
plt.legend(); plt.grid(True, alpha=0.3); plt.tight_layout()
plt.savefig("analog/plots/ota_plot.png", dpi=130)
print("Saved analog/plots/ota_plot.png")
