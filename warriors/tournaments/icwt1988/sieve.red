;Sieve
;by Dirk Wolff-Klammer
;West Germany
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
A             DAT      #0,           #0
START         MOV   <COUNT,        DEST
;
              JMZ      LEND,         COUNT
              MOV   #16,           A
LOOP          MOV   @A,          <DEST
              DJN      LOOP,         A
              SPL                 @DEST,          0
              JMZ      START,        A
LEND          MOV   #7,            COUNT
              JMZ      START,        A
COUNT         DAT      #0,           #7
              DAT      #0,           #125
              DAT      #0,           #250
              DAT      #0,           #500
              DAT      #0,           #1000
              DAT      #0,           #2000
              DAT      #0,           #4000
DEST          DAT      #0,           #0
              END      START

