;Death.s
;by Mark A. Durham: July 21, 1988
;United States of America
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
START         DJN      START,      <  BOMB
              JMN      START,         FENCE
FREEZE        MOV      ICE,        @  TARGET
              DJN      FREEZE,        TARGET
              MOV   # -1-TARGET,      TARGET
KILL          MOV      TARGET,     @  TARGET
              DJN      KILL,          TARGET
BOMB          JMN      KILL-1,     #  START
TARGET        DAT      #0,            #FREEZE-1
ICE           SPL      0,             ICE
FENCE         DAT      #0,            #1
              END      START

