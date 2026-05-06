;Fydgitr
;by Kenneth W. Clapp
;United States of America
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
TOP2          DAT      #0,            #0
              DAT      #0,            #0
              DAT      #0,            #0
              DAT      #0,            #0
              DAT      #0,            #0
TOP1          DAT      #0,            #0
RESTOMP       MOV      ZERO,       @  DEST1
STOMP         MOV   <  DEST1,      <  DEST2
              MOV   <  DEST1,      <  DEST2
              MOV   <  DEST1,      <  DEST2
              MOV   <  DEST1,      <  DEST2
              JMZ      STOMP,      @  DEST1
              ADD   #  9,             DEST1
SPLITA        ADD   #  9,             DEST2
              JMP      RESTOMP,       0
DEST1         DAT      #0,            #-10
DEST2         DAT      #0,            #-16
ZERO          DAT      #0,            #12
              DAT      #0,            #10
SKIPA         DAT      #0,            #325
              SPL      SPLITA,        0
              DAT      #0,            #4
              DAT      #0,            #678
              JMP      DEST2,         0
              DAT      #0,            #7
              DAT      #0,            #678
              JMP      SKIPA,         0
              DAT      #0,            #1993
              DAT      #0,            #325
START         MOV   <  ZERO,          DEST
              MOV   <  ZERO,          DEST
              MOV   <  ZERO,          STOP
LOOP          MOV      NUM1,       <  DEST
              MOV      NUM2,       <  DEST
              ADD   #  14,            DEST
              DJN      LOOP,          COUNT
STOP          JMP      START,         0
              JMP      RESTOMP,       0
NUM1          JMP      NUM1-1,        0
NUM2          SPL      NUM2-12,       0
COUNT         DAT      #0,            #1
              DAT      #0,            #1
              DAT      #0,            #1
              DAT      #0,            #1
              DAT      #0,            #1
              DAT      #0,            #1
              DAT      #0,            #1
              DAT      #0,            #1
;
              DAT      #0,            #1
              DAT      #0,            #1
              DAT      #0,            #1
              DAT      #0,            #1
;
DEST          DAT      #0,            #1
              END      START

