import numpy as np
import matplotlib.pyplot as plt

# columns: vfb  ea
d = np.loadtxt("ea_sweep.txt")
vfb = d[:, 0]
ea  = d[:, 1]

plt.figure(figsize=(8, 5))
plt.plot(vfb, ea, color="purple", linewidth=1.6)
plt.axvline(0.5, color="red", linestyle="--", alpha=0.6, label="v_ref = 0.5V")
plt.title("Error Amplifier Transfer Curve  (out = clamp[A*(vref - vfb)])")
plt.xlabel("Feedback voltage vfb (V)")
plt.ylabel("Error amp output (V)")
plt.legend()
plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig("error_amp_plot.png", dpi=130)
print("Saved error_amp_plot.png")
