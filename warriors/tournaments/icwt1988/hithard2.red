;Hit Hard 2
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;by Jon Newman
;United States of America
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
START         MOV   #4,             CNT
              MOV   #11,            BOMB1
LOOP1         MOV      BOMB1,        -8008
              ADD      BOMB1,         LOOP1
              JMN      LOOP1,         LOOP1
START2        MOV   # -8008,          LOOP1
              SUB      CNT,           BOMB1
              DJN      LOOP1,         CNT
LOOP2         MOV      BOMB2,      <TARGET2
CNT           JMP      LOOP2,         TARGET2+1
BOMB1         SPL      0,             11
BOMB2         DAT      #0,            #-10
TARGET2       DAT      #0,            #-10
              END      START

