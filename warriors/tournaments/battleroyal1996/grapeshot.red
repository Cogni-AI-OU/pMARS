;redcode-b
;name Three Core Monty
;author Andrew Fabbro
;version 1.0
;strategy transposing stone
;strategy based on Matthew Householder's "Stone"
;strategy Adapted for Battle Royal (8 processes)
;assert CORESIZE==8000

start   MOV     <2,     3
        ADD     #3044,  -1
        JMP     -2,     0
        DAT     #0,     #0
        END     start
