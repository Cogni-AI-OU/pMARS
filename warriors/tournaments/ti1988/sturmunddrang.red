; Sturm und Drang
; Giovanni Ciraolo e Luca Pancani
;
; Modernized for ICWS'88 compatibility: added mandatory commas and explicit B-fields.
;
;assert CORESIZE==8192
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0

p       dat     #2064, #0
q       dat     #0-2070, #0
start   add     #16, p
        sub     #11, q
        cmp     @p, @q
        jmp     b, 0
contr   jmn     start, p
a       add     #1, bomb
        mov     bomb, @bomb
        mov     tnt, <tnt
        jmp     a, 0
bomb    dat     #6, #0
tnt     dat     #0-5, #0
b       sub     #4, p
        add     #4, q
ba      mov     ddt, @p
        mov     ddt, @q
        add     #2, p
        sub     #2, q
        djn     ba, t
        add     #10, t
        jmp     contr, 0
ddt     spl     0, 0
t       dat     #10, #0

        end     start
