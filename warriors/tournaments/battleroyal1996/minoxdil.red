;redcode-94
;name Thermite II
;author Robert Macrae
;assert CORESIZE == 8000
;strategy Qscan -> bomber
;strategy Adapted for Battle Royal (Minoxdil)

        org     start

step    equ     12
strafelen equ   4

bomb    dat     <1,     step
qstep   dat     -step,  2*step

start   seq     100,    100+step
        jmp     found
        jmp     bomb

found   mov     bomb,   @100
        add     qstep,  found
        djn     found,  #strafelen
        jmp     start

        end
