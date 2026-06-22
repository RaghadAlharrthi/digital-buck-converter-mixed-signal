v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 550 -260 790 -260 {
lab=#net1}
N 650 -260 650 -220 {
lab=#net1}
N 550 -360 550 -320 {
lab=#net2}
N 790 -360 790 -320 {
lab=#net3}
N 510 -450 510 -390 {
lab=#net2}
N 750 -450 750 -390 {
lab=#net2}
N 510 -450 750 -450 {
lab=#net2}
N 510 -390 510 -340 {
lab=#net2}
N 510 -340 550 -340 {
lab=#net2}
N 550 -470 550 -420 {
lab=#net4}
N 550 -470 790 -470 {
lab=#net4}
N 790 -470 790 -420 {
lab=#net4}
N 530 -590 650 -590 {
lab=#net4}
N 650 -590 650 -470 {
lab=#net4}
N 650 -160 650 -130 {
lab=GND}
N 390 -290 510 -290 {
lab=#net5}
N 690 -290 750 -290 {
lab=#net6}
N 510 -190 610 -190 {
lab=#net7}
N 510 -130 510 -120 {
lab=GND}
N 390 -230 390 -210 {
lab=GND}
N 690 -230 690 -220 {
lab=GND}
N 530 -530 530 -510 {
lab=GND}
N 550 -290 550 -260 {
lab=#net1}
N 790 -290 790 -260 {
lab=#net1}
N 790 -420 790 -390 {
lab=#net4}
N 550 -420 550 -390 {
lab=#net4}
N 650 -190 650 -160 {}
C {/home/raghad/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 530 -290 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/home/raghad/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 770 -290 0 0 {name=M2
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/home/raghad/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} 530 -390 0 0 {name=M3
W=1
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {/home/raghad/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} 770 -390 0 0 {name=M4
W=1
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {/home/raghad/.volare/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 630 -190 0 0 {name=M5
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} 530 -560 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} 390 -260 0 0 {name=vref value=0.9 savecurrent=false}
C {vsource.sym} 690 -260 0 0 {name=vfb value=0.9 savecurrent=false}
C {vsource.sym} 510 -160 0 0 {name=Vbise value=0.8 savecurrent=false}
C {gnd.sym} 650 -130 0 0 {name=l1 lab=GND}
C {gnd.sym} 510 -120 0 0 {name=l2 lab=GND}
C {gnd.sym} 530 -510 0 0 {name=l3 lab=GND}
C {gnd.sym} 690 -220 0 0 {name=l4 lab=GND}
C {gnd.sym} 390 -210 0 0 {name=l5 lab=GND}
