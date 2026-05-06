; Fixed ICWS'88 syntax compatibility (commas, DAT modes, and B-operands) for pMARS strict mode.
;
;    Warrior: Ju Jit Su
;  File name: jujitsu.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: Stephen Tavener
;
start    SPL    6, 0
        MOV    #0, @2
        DJN    -1, 1
        DAT    <0, <-3
        SPL    0, 0
        DAT    <0, <-1
        SUB    #5, -1
        MOV    -3, @-2
        JMP    -2, 0
        END   start
