import numpy as np
import matplotlib.pyplot as plt

# wrdata writes columns: time  value  (whitespace separated)
data = np.loadtxt("ramp_out.txt")
t = data[:, 0] * 1e6   # convert seconds -> microseconds for readability
v = data[:, 1]

plt.figure(figsize=(9, 4))
plt.plot(t, v, color="purple", linewidth=1.3)
plt.title("Analog Ramp / Sawtooth Generator (500 kHz)")
plt.xlabel("Time (microseconds)")
plt.ylabel("Ramp voltage (V)")
plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig("ramp_plot.png", dpi=130)
print("Saved ramp_plot.png")
