;Asi-R
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;by Paolo Montrasio
;Italy
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
START         MOV   # -11,            B
LOOP          CMP   <A,          <B
              JMP      BOMB,          0
              DJN      LOOP,          A
              MOV   # -11,            B
              MOV   #5462,          A
LOOP2         MOV      ZERO,       <A
              MOV      ZERO,       <B
              DJN      LOOP2,         A
              MOV   #5462,          A
B             JMP      START,         0
BOMB          MOV      TRAP1,      @A
              MOV      TRAP1,      @B
              MOV      TRAP,       <A
              MOV      TRAP,       <B
              JMP      LOOP,          0
TRAP          SPL                    TRAP,          0
TRAP1         JMP      TRAP,          0
ZERO          DAT      #0,          #0
A             DAT      #0,          #5462
              END      START

