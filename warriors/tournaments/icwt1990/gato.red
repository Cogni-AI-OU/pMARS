; Fixed ICWS'88 syntax compatibility (commas, DAT modes, and B-operands) for pMARS strict mode.
;
;    Warrior: Gato
;  File name: gato.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: Cristobal Jimenez Lopez
;
beg      dat    <0, <59
fire     dat    <0, <0
beg1     dat    <0, <25
start    mov    care, loop2
        mov    recons, switch
        spl    trap, 0
        mov    #810, forward
        mov    #-810, back
        mov    #25, beg1
make     mov    @beg1, <forward
        mov    @beg1, <back
        djn    make, beg1
test     mov    #810, forward
        mov    #-810, back
        mov    #25, beg1
compare  cmp    <forward, <back
        jmp    alarm, 0
label    cmp    @beg1, @forward
        jmp    repair, 0
salto    djn    compare, beg1
loop2    jmp    test, 0
alarm    mov    count, switch
        mov    #59, beg
        mov    #-2000, forward
copy     mov    @beg, <forward
        djn    copy, beg
        add    #2, forward
        jmp    @forward, 0
repair   mov    @forward, @beg1
        mov    forward, loop2
back     jmp    salto, 0
forward  jmp    1, 0
recons   jmp    -5, 0
trap     mov    #800, desjmp
loop1    add    #10, desjmp
        jmz    loop1, @desjmp
        sub    desjmp, jmp1
        add    #1, jmp1
        mov    jmp1, @desjmp
switch   jmp    loop1, 0
        mov    count, alarm
        mov    #0, beg1
        mov    beg1, 5000
dis      mov    beg1, <fire
        mov    count, @desbom
        add    #5, desbom
        jmn    ajust, 4996
desbom   jmp    dis, #25
ajust    mov    #25, desbom
desjmp   jmp    -7, 0
        mov    forward, switch
        djn    split, count
split    spl    -2, 0
        mov    beg1, <fire
        mov    count, alarm
        jmn    split, count
        mov    count, split
count    dat    <0, <64
jmp1     jmp    @jmp1, 0
care     jmp    -8, 0
               end     start
