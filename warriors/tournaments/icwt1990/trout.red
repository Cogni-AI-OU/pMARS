;
;    Warrior: Trout
;  File name: trout.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: C Butcher / New Zealand
;
time     dat    <0, #0
compare  cmp    #0, @20         ;was cmp @20 #0 - CWS'88 violation

        jmp    bomb, 0
        mov    @18, @a
        add    #5, a
checktime jmp    compare, 0
bomb     mov    create, @a
        add    #1, a
        mov    jump, @a
        mov    #100, time
        djn    -1, time
        mov    #20, time
        mov    #0, <a
        djn    -1, time
        jmp    compare, 0
create   spl    0, 0
jump     jmp    -1, 0
a        dat    <0, #28
           end  compare
