import numpy as np
import matplotlib.pyplot as plt
from scipy import signal

Vin = 12.0
L   = 10e-6
C   = 100e-6
R   = 3.3

num = [Vin]
den = [L*C, L/R, 1]
Gvd = signal.TransferFunction(num, den)

f0 = 1/(2*np.pi*np.sqrt(L*C))
Q  = R*np.sqrt(C/L)
print(f"LC resonant frequency f0 = {f0:.0f} Hz")
print(f"Quality factor Q       = {Q:.2f}")

w = np.logspace(2, 6, 2000) * 2*np.pi
w, mag, phase = signal.bode(Gvd, w)
f = w/(2*np.pi)

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(9, 7), sharex=True)
ax1.semilogx(f, mag, color="purple", linewidth=1.5)
ax1.axvline(f0, color="red", linestyle="--", alpha=0.6, label=f"f0 = {f0:.0f} Hz")
ax1.set_ylabel("Gain (dB)")
ax1.set_title("Buck Control-to-Output Gvd(s): Bode Plot")
ax1.legend(loc="upper right")
ax1.grid(True, which="both", alpha=0.3)
ax2.semilogx(f, phase, color="green", linewidth=1.5)
ax2.axvline(f0, color="red", linestyle="--", alpha=0.6)
ax2.axhline(-90, color="gray", linestyle=":", alpha=0.5)
ax2.set_ylabel("Phase (degrees)")
ax2.set_xlabel("Frequency (Hz)")
ax2.grid(True, which="both", alpha=0.3)
plt.tight_layout()
plt.savefig("analog/plots/bode_plot.png", dpi=130)
print("Saved analog/plots/bode_plot.png")
