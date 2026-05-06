;Wasp Nest
;by Alexander Burtzev
;Union of Soviet Socialist Republics
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
PUSK          MOV      FB,         <  B
              MOV      FA,         <  B
              MOV   <  A,          <  B
              SUB   <  A,          <  A
              JMP   @  B,             0
U             DAT      #0,            #4000
SKIPA         MOV      U,          <  U
              DJN      SKIPA,      <  U
S             SPL      SKIPA,         0
A             JMP      S,             0
FA            JMP      A,             0
              JMP      -1,            0
              JMP      -1,            0
              JMP      -1,            0
              JMP      -1,            0
              JMP      -1,            0
              JMP      -1,            0
              JMP      -1,            0
B             JMP      -1,            0
FB            JMP      -1,            0
START         MOV   # -223,          FB
SEC           MOV   #  0,            A
;
              ADD   # -1407,         B
              SPL      10,            0
              SPL      10,            0
              SPL      10,            0
              SPL      10,            0
              SPL      10,            0
              SPL      10,            0
              SPL      10,            0
              SPL      10,            0
              SPL      10,            0
              JMP      PAUSE,         0
              JMP      1,             0
              JMP      1,             0
              JMP      1,             0
              JMP      1,             0
              JMP      1,             0
              JMP      1,             0
              JMP      1,             0
              JMP      1,             0
              JMP      PUSK,          0
PAUSE         JMP      1,             0
              JMP      1,             0
              JMP      1,             0
              DJN      SEC,          K
              MOV   # -1000,         K
LOOP          MOV      K,          < K
              DJN      LOOP,       < K
K             DAT      #0,           #7
              END      START

