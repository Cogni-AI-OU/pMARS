;redcode
;name Unrolled Boot
;strategy Simple boot method using an unrolled loop.

        bdist  equ 1000

        mov    <ssrc,    {sdest
        mov    <ssrc,    {sdest
        mov    <ssrc,    {sdest
        mov    <ssrc,    {sdest

sdest   jmp    bdist+4            ; destination pointer
ssrc    dat    inc+4              ; source pointer

; stone to be booted away

        step   equ 1185

inc     spl    #-step,   <step
stone   mov    >step,    1-step
        sub    inc,      stone
        djn.f  stone,    <5555
