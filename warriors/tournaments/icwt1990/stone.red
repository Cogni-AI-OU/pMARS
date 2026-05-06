; Fixed ICWS'88 syntax compatibility (commas, DAT modes, and B-operands) for pMARS strict mode.
;
;    Warrior: Stone
;  File name: stone.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: Matthew Householder
;
start    mov    <2, 3
        add    d1, start
        jmp    start, 0
        dat    <0, <0
d1       dat    <-5084, <5084
        end     start
