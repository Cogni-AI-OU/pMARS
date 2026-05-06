;Wipe 5
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;by Anonymous
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
COUNT         DAT      #0,           #0
START         MOV      COUNT-1,      CLEAR
LOOP1         SUB      SUBT,         PNTR
              CMP      CLEAR,      @PNTR
              JMP      WIPE,         0
              JMP      LOOP1,        0
WIPE          CMP      IMP,        @PNTR
              JMP      WIPE2,        0
GATE          SPL      GETIMP,       0
WIPE2         MOV      PNTR,         PTR
LOOP2         MOV      SPLIT,      @PTR
              ADD   #1,            PTR
              CMP      CLEAR,      @PTR
CLOSED        JMP      LOOP2,        0
              MOV      PTR,        <COUNT
WIP2          MOV      SPLIT,      @PNTR
              CMP      CLEAR,      <PNTR
              JMP      WIP2,         0
              CMP      SPLIT,        PTR
              JMP      LOOP1,        0
              MOV      COUNT,        PNTR
              MOV   # -58,           PNTR
              ADD      COUNT,        PNTR
              MOV      CLEAR,      @PNTR
              SUB   #4,            SUBT
              JMN      LOOP1,        SUBT
              MOV      COUNT,        PTR
              MOV   #0,            COUNT
LOOP4         MOV   <COUNT,        CLEAR
              MOV      SPLIT2,     @CLEAR
              CMP      COUNT,        PTR
              JMP      LOOP4,        0
              MOV      PNTR,         PTR
LOOP3         MOV      PTR,        <PNTR
              JMP      LOOP3,        0
IMPPTR        DAT      #0,           #66
IMPPTR2       DAT      #0,           #66
VELOCITY      DAT      #0,           #3
GETIMP        ADD      PNTR,         IMPPTR
              MOV      CLOSED,       GATE
              MOV      IMPPTR,       IMPPTR2
LOOP5         MOV      CLEAR,      @IMPPTR
              CMP   @IMPPTR2,      IMP
              JMP      LOOP5,        0
              MOV      CLEAR,      @IMPPTR2
              ADD      VELOCITY,     IMPPTR2
              ADD      VELOCITY,     IMPPTR
              CMP   @IMPPTR2,      IMP
              JMP      LOOP5,        0
              ADD   #1,            VELOCITY
              JMP      LOOP5,        0
IMP           MOV      IMP,          IMP+1
SUBT          DAT      #0,           #12
SPLIT2        SPL      SPLIT2,       0
CLEAR         DAT      #0,           #0
PTR           DAT      #0,           #0
SPLIT         SPL      PTR,          0
PNTR          DAT      #0,           #-58
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
;
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
              DAT      #0,           #1
              END      START
