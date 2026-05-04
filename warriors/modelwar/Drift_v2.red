;redcode-94nop
;name Pyre-Swept-v3
;author Drift (evolved)
;strategy Best confirmed: step=7211, dec=3000, gap=13, ptr=700, ispacing=2437
;strategy 10.086 @2000r vs ladder (step=7211 > 1327 by +2.6%)
;assert CORESIZE==25200

        qstep equ 9001
        qgap  equ 7
        ispacing equ 2437
        org qs1

qs1     sne    qstep*3,  qstep*3+qgap
        seq    qstep*7,  qstep*7+qgap
        jmp    qhit
qs2     sne    qstep*11, qstep*11+qgap
        seq    qstep*17, qstep*17+qgap
        jmp    qhit
qs3     sne    qstep*23, qstep*23+qgap
        seq    qstep*29, qstep*29+qgap
        jmp    do_clear

qhit    jmp    scan
        gate   equ clear_s-4
        step   equ 7211
        gap    equ 13
        first  equ bptr-1+step

bptr    dat    #1,       #11
dptr    spl    #3000,    13
clear_s mov    *bptr,    >gate
        mov    *bptr,    >gate
        djn.f  clear_s,  }dptr

        for    5
        dat    0,0
        rof

scan    add    inc,      scanptr
scanptr sne    first+gap,}first
        djn.f  scan,     *scanptr
        mov    scanptr,  gate
        jmp    clear_s-1, <gate

        for    5
        dat    0,0
        rof

inc     dat    step,     step

ptr     dat    0, 700
clrbomb dat    <2667, 25
        for    15
        dat    0, 0
        rof

clear_g spl    #0,     >ptr
loop    mov    clrbomb, >ptr
        djn.f  loop,   >ptr

        for    26
        dat    0, 0
        rof

lstep   dat    ispacing, -10
do_clear:
        spl    1
        spl    1
        spl    1
        spl    1
        spl    1
        spl    2
        djn.f  imp, <-500
        add    lstep, -1
        djn.f  clear_g, <-1300
imp     mov.i  #1, ispacing
        end    qs1
