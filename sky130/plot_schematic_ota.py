import numpy as np, subprocess, matplotlib.pyplot as plt
# re-run to capture full sweep data
import os
os.system("cd ~/AI-HDL/digital-buck-controller && ngspice -b sky130/ota_from_schematic.spice > /dev/null 2>&1")
