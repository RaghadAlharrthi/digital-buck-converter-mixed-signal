from vcdvcd import VCDVCD
import matplotlib.pyplot as plt

vcd = VCDVCD('sim/buck_top.vcd')

def series(name_part):
    sig = [s for s in vcd.references_to_ids if name_part in s][0]
    tv = vcd[sig].tv
    times = [t / 1000.0 for t, v in tv]          # ps -> ns
    vals  = [int(v, 2) if v not in ('x','z') else 0 for t, v in tv]
    return times, vals

t_out, v_out = series('v_out')
t_ref, v_ref = series('v_ref')
t_duty, duty = series('duty')

fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 6), sharex=True)

ax1.step(t_out, v_out, where='post', label='v_out', color='#0a84ff', linewidth=1.5)
ax1.step(t_ref, v_ref, where='post', label='v_ref (target)', color='#34c759', linestyle='--')
ax1.axvline(20000, color='red', linestyle=':', alpha=0.7)
ax1.text(20300, 1500, 'supply sag 12V->9V', color='red', fontsize=9)
ax1.set_ylabel('Voltage (mV)')
ax1.set_title('Closed-Loop Buck Controller: Regulation & Disturbance Recovery')
ax1.legend(loc='lower right'); ax1.grid(alpha=0.3)

ax2.step(t_duty, duty, where='post', color='#ff9500', linewidth=1.5)
ax2.axvline(20000, color='red', linestyle=':', alpha=0.7)
ax2.set_ylabel('Duty (0-255)'); ax2.set_xlabel('Time (ns)')
ax2.grid(alpha=0.3)

plt.tight_layout()
plt.savefig('images/regulation.png', dpi=130)
print('Saved images/regulation.png')
