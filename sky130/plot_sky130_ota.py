import numpy as np
import matplotlib.pyplot as plt
d = np.loadtxt("sky130_ota_sweep.txt")
vfb, out = d[:,0], d[:,1]
plt.figure(figsize=(8,5))
plt.plot(vfb, out, color="purple", linewidth=1.8)
plt.axvline(0.9, color="red", linestyle="--", alpha=0.6, label="vref = 0.9V")
plt.title("SKY130 5-Transistor OTA - Transfer Curve (real foundry models)")
plt.xlabel("Feedback voltage vfb (V)")
plt.ylabel("Output (V)")
plt.legend(); plt.grid(True, alpha=0.3); plt.tight_layout()
plt.savefig("analog/plots/sky130_ota_plot.png", dpi=130)
print("Saved analog/plots/sky130_ota_plot.png")
