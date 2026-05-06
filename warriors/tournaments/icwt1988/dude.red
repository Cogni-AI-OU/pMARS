;Dude
;by John R. Perry
;United States of America
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
I             MOV   #0,             I-1
J             JMP      I,             0
              MOV      TRP2,          J
C3            DAT      #0,          #C3
DUDE          MOV   #0,             CNT
              MOV   #201,           C2
              MOV   #  -99,           C3
LOOP          MOV   <CNT,        <C2
              MOV      BMB,        <C3
              CMP   # -16,            CNT
C2            JMP      LOOP,          0
              MOV      CNT,        @C3
TTT           SPL                     188,           0
              JMP      I,             0
TRP2          JMP      TTT,           0
BMB           SPL                     BMB,           0
CNT           DAT      #0,          #CNT
              END      DUDE

