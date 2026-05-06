;Wally
;by Gaylan D. Wallis
;United States of America
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
KILL          MOV      J1,         @ PTR
LOOP          MOV      S1,         < PTR
              JMZ      LOOP,       < PTR
              CMP   #  842,        @ PTR
              JMP      KILL,          0
              MOV   #  0,            S1
              ADD   # -16,           PTR
              JMP      LOOP,          0
S1            SPL      0,             S1
J1            JMP      -1,            0
PTR           DAT      #0,            #-64
              DAT      #0,            #842
              DAT      #0,            #842
              DAT      #0,            #842
              DAT      #0,            #842
              END      KILL

