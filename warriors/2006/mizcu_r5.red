;assert 1
;name R5
;author Miz
step equ -474
fang: jmp @step+9, -step
for 8
dat $0, $0
rof
tag: dat <2667, s
for 8
dat $0, $0
rof
s: spl #step, #-step
mov.i @0, @fang
add.f -2, fang
jmp -2
start: spl s
jmp dc
for 9
dat $0, $0
rof
dc: spl #0, {-4
mov.i 3, >-5
djn.f -1, >-6
dat $0, $0
dat >2667, 9
end start
