;Lux 2 T
;by Luca Crosara
;Italy
;
; Modified to resolve syntax issues and ensure compatibility with pMARS
; assembly in ICWS'88 mode.
;
;assert 1
;
              DAT                 #1
              DAT                 #1
;
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
;
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
JJ            JMP                    JJ-1,          0
SS            SPL                    0,             0
START         ADD      JJB,          COUNT1
              JMZ      SSS,       @COUNT
              CMP   #47,           COUNT
COUNT         JMP      JJJ,          -2169
JJB           JMP      BBB,          12
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
JJJ           MOV      JJ,        @COUNT
              MOV      SS,        <COUNT
              ADD   #1,            COUNT
SSS           SUB      JJB,          COUNT
              JMZ      START,     @COUNT1
J             MOV      JJ,        @COUNT1
              MOV      SS,        <COUNT1
              ADD   #1,            COUNT1
COUNT1        JMN      START,        2064
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
BBB           MOV   # -51,           COUNT
              MOV   #45,           COUNT1
              MOV      JJBB,         JJB
;
              JMP      START,         0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
              DAT   #0,          #0
JJBB          JMP      40,           6
HHJJ          MOV      BOMB,      @BOMB
              DJN      HHJJ,         BOMB
BOMB          DAT   #0,          # -23
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
;
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
;
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
;
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
;
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
;
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
;
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              DAT                 #1
              END      START
