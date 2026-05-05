;
;    Warrior: Scissors
;  File name: scissors.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: Matthew Householder
;
start    mov    #-101, ptr-5084
look     add    #5084, ptr
look2    jmz    look, @ptr
ptr      mov    stun2, ptr
        mov    stun1, <ptr
        add    #5084+1, ptr
        jmn    look2, ptr
        jmp    1, 0
halt     mov    bomb, <bptr
        jmp    halt, 0
stun1    spl    0, 0
stun2    jmp    -1, 0
bomb     dat    <0, <halt-bptr
bptr     dat    <0, <look
        end       start
