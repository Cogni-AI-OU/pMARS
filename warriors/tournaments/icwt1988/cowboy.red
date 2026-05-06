;Cowboy
;by Eugene P. Lilitko
;Union of Soviet Socialist Republics
;
; Modified to resolve syntax issues and ensure compatibility with pMARS 
; assembly in ICWS'88 mode.
;
;assert 1
;
;The snare for the opponent's processes.
;Bison commits suicide when all 64 processes are captured.
;
;FIRE          DAT                    FIRE
FIRE          DAT      #0,           #FIRE
;
;BEG           DAT                    BEG
BEG           DAT      #0,           #BEG
FENCE         MOV      SUCCESS,      SWITCH
DEMON         SUB   #1,            BISON
HELP          SPL                    DEMON,         0
BOMBING       MOV      FIRE,       <FIRE
              JMN      HELP,         BISON
              MOV      BOMB,         HELP
;BOMB          DAT                    BOMB
BOMB          DAT      #0,           #BOMB
;BISON         DAT                    64
BISON         DAT      #0,           #64
COUNT         JMP      FENCE,         0

;
;Welcome to the snare!
;
WELLC1        JMP   <WELLC1,      0
WELLC2        JMP   @WELLC2,      0
;
;
;The main code.  Traps are set, inviting the opponent to jump
;into the snare.  When the bison are captured, SWITCH is changed
;to the instructions of SUCCESS.
;
;START         MOV      REST,         SWITCH
START         MOV      REST,         SWITCH
GBOMB         MOV   #575,          FIRECNT
              MOV   #64,           BISON
              SPL                    RADAR,         0
CONT          MOV   #4098,         WELLC1
              MOV   # -4099,         WELLC2
LOOP          MOV      WELLC1,     @WELLC2
              MOV      WELLC2,     @WELLC1
              ADD   #7,            WELLC1
              SUB   #7,            WELLC2
SWITCH        DJN      LOOP,         FIRECNT
;
;All right! There are bison in the snare.  The captured bison invite free
;bison into the trap.  Cowboy must help them!
;
;NEW           MOV      BOMB,         FIRE
NEW           MOV      BOMB,         FIRE
              MOV      BOMB,         KILL
SHOOT         MOV      FIRE,       <FIRE
              JMZ      SHOOT,        KILL
FORWARD       JMP      NEW,           0
SUCCESS       MOV      GBOMB,        SUCCESS
REST          DJN      SHOOT,        COPY+3
;
;The defense process.  Build a set of pickets, test for a breach of the
;pickets, and switch to defensive action when the pickets are breached.
;Defense occurs when Cowboy is copied to a new place in memory, and the
;copy begins operating properly.
;
;RADAR         MOV   #  638,          FORWARD
RADAR         MOV   #638,          FORWARD
              MOV   # -638,          BACK
              MOV   #25,           COUNT
MAKE          MOV      COUNT,      <FORWARD
              MOV      COUNT,      <BACK
              DJN      MAKE,         COUNT
TEST          MOV   #638,          FORWARD
              MOV   # -638,          BACK
              MOV   #25,           COUNT
COMPARE       CMP   <FORWARD,    <BACK
BACK          JMP      ALARM,         0
KILL          DJN      COMPARE,      COUNT
FIRECNT       JMP      TEST,          0
ALARM         MOV      BOMB,         SWITCH
              MOV   #50,           BEG
              MOV   #3310,         FORWARD
COPY          MOV   @BEG,        <FORWARD
              DJN      COPY,         BEG
              MOV      NEW,          BOMBING
              ADD   #11,           FORWARD
;
FINISH        JMP   @FORWARD,      0

              END      START
