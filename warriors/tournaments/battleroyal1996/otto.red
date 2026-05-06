;redcode-94
;name Tornado 3.0
;author Beppe
;assert CORESIZE==8000
;strategy Fast 60% c bomber
;strategy Adapted for Battle Royal (Otto)

step    equ     -45
away    equ     4000

boot    mov     {src,   {dst
        mov     {src,   {dst
        mov     {src,   {dst
        mov     {src,   {dst
        mov     {src,   {dst
dst     spl     @0,     away
        mov     0,      boot
src     dat     last+1, 0

        spl     #step,  -step
start   sub     incr,   @b1
stone   mov     (0*step)+jump, *(1*step)+jump
b2      mov     -2,     @stone
b1      mov     bombm,  *stone
jump    djn.f   -4,     {-2000
incr    dat     >-3*step, >-3*step
bombm   mov     {step,  1
last
        end     boot
