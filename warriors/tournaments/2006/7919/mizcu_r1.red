;redcode-round1
;assert (CORESIZE==7919) && (MAXPROCESSES==50)
;assert (MAXCYCLES==79000) && (MAXLENGTH==100)
;assert (MINDISTANCE==100)
;name Something quick
;author Mizcu

step equ 217
dist equ 2519
top: add.ab #7, #0
    mov.i <top, <bottom
    mov.i {-step, {step
    sub.ab @0, -1
    jmn.b -3, @top
    spl @top, <4000
bottom: jmz.b @0, dist

for 80
dat $0, $0
rof

start: mov bottom, bottom+2000
mov bottom, bottom+6000
mov {-2, <-2
mov {-2, <-2
djn.b -2, #6
spl @-5, <1000
spl @-5, <3000
jmp top, <5000
end start
