;redcode-CSE2006 
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;name R3JHB 
;author Zul Nadzri 
;strategy You know I will use pspace if given that option! 
;strategy I really want to optimise... but against what??? 
;strategy The coresize is unknown, the process is unknown, the variance is big. 
;strategy Hope I got the correct combo this time -- weak against several published warriors. 
;strategy Warriors used are Hullabaloo3 and Dawn2 (...I really think so) 
;assert (MAXCYCLES==80000) && (MAXLENGTH==100) 
;assert (MINDISTANCE==100) 
 
PIN 10 
 
;------------------------------------------ war2 
bDist1 equ 6133 
bDist2 equ 4122 
 
pDecoy stp #12, #230 
 stp #17, #460 
war2 spl 1 , <3555 
 spl 1 , <5335 
 spl 1 , <2363 
 
 mov {pap1 , {1 
pBoot1 spl bDist1 , >5747 
 
 mov {pap , {1 
pBoot2 djn.f bDist2 , >4584 
 
dat 0,0 
 
nstep1 equ 851 
cstep1 equ 5170 
tstep1 equ 3218 
 
pap spl @8 , }tstep1 
 mov.i }pap , >pap 
nothA spl @nothA , }cstep1 
 mov.i }nothA , >nothA 
nothB spl @nothB , }nstep1 
 mov.i }nothB , >nothB 
 mov.i #1138 , <1 
 djn -2 , <973 
 
dat 0,0 
 
iStep equ 1143 
pStep equ 2044 
sStep equ 4903 
 
pap1 spl @8 , }pStep 
 mov.i }pap1 , >pap1 
 spl #0 , 0 
 mov bomb , >ptr 
 add.x imp , ptr 
ptr jmp imp-iStep*8 , >sStep-6 
bomb dat >1 , }1 
imp mov.i #sStep-1 , iStep 
 
for 16 
dat 0,0 
rof 
 
;------------------------------------------------------ war1 
 
 DAT.F > -87, > -1375 
war1 MOV.I $25, $ -3405 
 SPL.B }2, }2487 
 SPL.B $1, }418 
 SPL.B $0, } -1651 
 MOV.I <15, {1 
 SPL.B $ -3145, <1719 
 MOV.I {28, {2 
 SPL.B * -2, < -899 
 DJN.F $560, <821 
 DAT.F $0, $0 
 DAT.F $0, $0 
 DAT.F $0, $0 
 DAT.F $0, $0 
 DAT.F $0, $0 
 DAT.F $0, $0 
 DAT.F $0, $0 
 DAT.F $ -18, $3452 
 DAT.F $ -19, $1383 
 DAT.F $0, $0 
 SPL.B #0, $6 
 MOV.I $ -260, @2 
 ADD.AB #34, $1 
 MOV.I $ -262, }754 
 DJN.F $ -3, {2926 
 DAT.F $0, $0 
 DAT.F }17, >1 
 DAT.F $0, $0 
 DAT.F $0, $0 
 SPL.B $561, {3 
 MOV.I }2, } -1 
 MOV.I $3, > -843 
 MOV.I $3, } -3 
 JMZ.F $ -4, * -1 
 DAT.F < -2666, <2667 
 DAT.F $0, $0 
 
for 16-4-2 
dat 0,0 
rof 
war11 dat 0,0 
war22 dat 0,0 
 
;----------------------------------------------------------- 
pflag equ 302 
strat1 equ war1 
strat2 equ war2 
 
pGold ldp.ab #0, #0 ; get results of last battle 
 sne.ab #-1, pGold 
 jmp pDecoy, >4567 
 ldp.a #pflag, pGold ; retrieve attempted strategy 
 add.a #1, @pGold ; if a loss, increment strategy 
 mod.a #2, pGold ; safeguard against brainwashing 
 stp.ab pGold, #pflag ; store current strategy 
 jmz.a strat1, pGold ; select strategy 1 
qptr jmp strat2, }6543 ; select strategy 2 
 
end pGold 
