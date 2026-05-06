; Panca 1
; Luca Pancani e Giovanni Ciraolo
;
;assert CORESIZE==8192
p       dat     #2068, #0
start   spl     b, 0
a       add     #16, p
        jmz     a, @p
        sub     #10, p
        mov     ad, @p
        mov     ac, <p
        mov     ab, <p
        mov     aa, <p
        spl     @p, 0
        add     #600, p
        jmp     a, 0
aa      add     #1, 3
ab      mov     2, @2
ac      jmp     -2, 0
ad      dat     #3, #0
b       sub     #15, h
        jmz     b, @h
        add     #5, h
        mov     bc, @h
        mov     bb, <h
        mov     ba, <h
        spl     @h, 0
        sub     #600, h
        jmp     b, 0
ba      mov     2, <h
bb      jmp     -1, 0
bc      dat     #0-3, #0
h       dat     #-2072, #0

        end     start
