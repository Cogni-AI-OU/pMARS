; Fixed ICWS'88 syntax compatibility (commas, DAT modes, and B-operands) for pMARS strict mode.
;
;    Warrior: DAC - Divide and Conquer
;  File name: dac.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: Mark A. Durham
;       Date: December 4, 1990
;
        JMP    START, 0
SOURCE   DAT    <0, #TARGET
START    MOV    #TARGET-SOURCE, SOURCE
        MOV    #2342+SOURCE-TARGET, TARGET
COPY     MOV    @SOURCE, <TARGET
        DJN    COPY, SOURCE
        SPL    @TARGET, 0
        MOV    #155, TARGET
ENSLAVE  MOV    TRAP, @TARGET
        DJN    ENSLAVE, TARGET
        MOV    #155, TARGET
KILL     MOV    FREE, @TARGET
        DJN    KILL, TARGET
FREE     DAT    <0, #63
TRAP     SPL    TRAP, 0
TARGET   DAT    <0, #2432+SOURCE-TARGET
        END START
