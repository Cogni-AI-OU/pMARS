;redcode
;name Transposition Stone
;strategy Moves instructions around in a pseudo-random pattern.

        step   equ 1185           ; mod 5

inc     spl    #-step,   <step
stone   mov    >step,    1-step
        sub    inc,      stone
        djn.f  stone,    <5555
