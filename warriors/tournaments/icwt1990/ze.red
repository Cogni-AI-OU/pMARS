; Fixed ICWS'88 syntax compatibility (commas, DAT modes, and B-operands) for pMARS strict mode.
;
;    Warrior: ZE
;  File name: ze.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: Douglas McDaniels
;
start    SPL    stb, 0
        SPL    ste, 0
        SPL    sth, 0
        SPL    stk, 0
        SPL    stc, 0
        SPL    stf, 0
        SPL    sti, 0
        SPL    stl, 0
        SPL    std, 0
        SPL    stg, 0
        SPL    stj, 0
        SPL    stm, 0
sta      ADD    #-28, a
        MOV    a, @a
        JMP    sta, 0
a        DAT    <0, <-512
stb      ADD    #-28, b
        MOV    b, @b
        JMP    stb, 0
b        DAT    <0, <-1536
stc      ADD    #-28, c
        MOV    c, @c
        JMP    stc, 0
c        DAT    <0, <-1024
std      ADD    #-28, d
        MOV    d, @d
        JMP    std, 0
d        DAT    <0, <-2048
ste      ADD    #-28, e
        MOV    e, @e
        JMP    ste, 0
e        DAT    <0, <-2560
stf      ADD    #-28, f
        MOV    f, @f
        JMP    stf, 0
f        DAT    <0, <-3584
stg      ADD    #-28, g
        MOV    g, @g
        JMP    stg, 0
g        DAT    <0, <-3072
sth      ADD    #-28, h
        MOV    h, @h
        JMP    sth, 0
h        DAT    <0, <-4096
sti      ADD    #-28, i
        MOV    i, @i
        JMP    sti, 0
i        DAT    <0, <-5120
stj      ADD    #-28, j
        MOV    j, @j
        JMP    stj, 0
j        DAT    <0, <-4680
stk      ADD    #-28, k
        MOV    k, @k
        JMP    stk, 0
k        DAT    <0, <-5632
stl      ADD    #-28, l
        MOV    l, @l
        JMP    stl, 0
l        DAT    <0, <-6656
stm      ADD    #-28, m
        MOV    m, @m
        JMP    stm, 0
m        DAT    <0, <-6144
         END     start
