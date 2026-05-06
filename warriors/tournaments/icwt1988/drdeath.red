;Dr. Death
;by A. K. Dewdney
;Canada
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
START         SPL                     PARTA,         0
              SPL                     PARTB,         0
PTR           SPL                     PARTC,         0
TOP           MOV   #  0,             PTR
ZAP           MOV      PTR,           BOMB
SPAWNA        JMP      TOP,           0
PARTA         MOV   #  0,          @  WHOA
              ADD   #  101,           WHOA
LOOPA         MOV   #  0,          @  WHOB
              ADD   #  101,           WHOB
WHOA          MOV   #  1,             BANG
PARTB         JMP      LOOPA,         0
WHOB          DAT   #  0,             #  500
CENTER        CMP   @  BOMB,       @  BOMB
              JMP      KILL,          0
              CMP   # -1,             BOMB
              JMP      SKIP1,         0
              SUB   # -32,            BOMB
              SUB   # -32,            BOMB+1
SKIP1         ADD   #  1,             BOMB
              ADD   #  1,             BOMB+1
PARTC         MOV   #  1,             DONG
              JMP      CENTER,        0
MID           SUB   #  1,             BANG-1
              JMZ      SKIP2,         BANG-1
              SPL                     SPAWNA,        0
SKIP2         SUB   #  1,             BANG
              JMZ      SKIP3,         BANG
              SPL                     LOOPA,         0
;
SKIP3         SUB   #  1,             DONG
              JMZ      SKIP4,         DONG
              SPL                     CENTER,        0
SKIP4         SUB   #  1,             DONG+1
              JMZ      SKIP5,         DONG+1
              SPL                     -51,           0
SKIP5         MOV   #  1,             ZAP
              JMP      MID,           0
KILL          MOV   @  BOMB,       @  BOMB+1
              JMP      CENTER,        0
BOMB          DAT   #  0,             #  SPAWNA
              DAT   #  0,             # -75
              DAT   #  0,             #  1
BANG          DAT   #  0,             #  1
DONG          DAT   #  0,             #  1
              DAT   #  0,             #  1
              END                     START

