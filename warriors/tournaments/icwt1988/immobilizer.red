;Immobilizer
;by Bram Cohen
;United States of America
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
START         SPL                      STARTA,        0
              JMP       STARTB,        0
PTRC          DAT       #0,            #26
PTRA          DAT       #0,            #32
IMMBLZEA      MOV    #  32,            PTRA
STARTA        MOV       SPLBOMBA,    @ PTRA
              ADD    #  16,            PTRA
              JMN       STARTA,        PTRA
KILLA         MOV    #  26,            PTRC
SKIPA         MOV       PTRA,        @ PTRC
              ADD    #  2,             PTRC
              JMN       SKIPA,         PTRC
              JMP       IMMBLZEA,      0
SPLBOMBA      SPL       SPLBOMBA,      0
              DAT       #0,            #0
              DAT       #0,            #0
              DAT       #0,            #0
IMMBLZEB      MOV    # -32,            PTRB
STARTB        MOV       SPLBOMBB,    @ PTRB
              SUB    #  16,            PTRB
              JMN       STARTB,        PTRB
KILLB         MOV    # -26,            PTRB
SKIPB         MOV       PTRB,        @ PTRB
              SUB    #  2,             PTRB
              JMN       SKIPB,         PTRB
              JMP       IMMBLZEB,      0
SPLBOMBB      SPL       SPLBOMBB,      0
PTRB          DAT       #0,            #-32
              END      START

