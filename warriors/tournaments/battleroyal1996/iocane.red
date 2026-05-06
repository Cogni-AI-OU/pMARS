;redcode-94
;name Lithium
;author John K Wilkinson
;assert CORESIZE == 8000
;strategy incendiary bomber
;strategy Adapted for Battle Royal (8 processes)
;strategy "Iocane Powder. The Die Hard of the 8 process world? :)"

step    equ     3044
away    equ     4000

boot    mov     {src,   {dst
        mov     {src,   {dst
        mov     {src,   {dst
        mov     {src,   {dst
        mov     {src,   {dst
dst     spl     @0,     away
        mov     0,      boot
src     dat     last+1, 0

        spl     #step,  <-step
start   sub     -1,     stone
stone   mov     -2,     *step
        djn.f   -2,     <-2000
last    dat     0,      0

        end     boot
