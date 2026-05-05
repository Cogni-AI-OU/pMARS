;redcode-94
;name Nax
;author Zul Nadzri
;strategy Dumb+smart=draw
;assert 1

        pKey   equ 20
        front  equ imp
        cloner equ gate
        clp    equ clear
w1 equ imp
w2 equ gate
w3 equ clear

gate: jmp #0,<-3
ptr equ clear-3
clear: mov bmb,}ptr ;<-- must start here
mov bmb,}ptr
jmp -2
bmb: dat 7,0
imp: mov.i #4,1

start	ldp #1, #0	;table
a2	ldp #2, #0	;rounds
a3	ldp #3, #0	;point
a0	ldp #0, #0	;results
	seq #1, start
	jmp table2
table1 seq #18, a2
	jmp round1
	slt.b a3, #27
	jmp okay1
ko1	stp #2, #1
	stp #1, #2
	stp #1, #3
	stp #0, #pKey
	jmp pThink
round1 add #1, a2
	mov.ba a2, 1
	stp #0, #2
	seq #1, a0
	jmp notwin1
win1	add #3, a3		;win=3, draw=1
	mov.ba a3, 1
	stp #0, #3
	jmp war1
notwin1 seq #0, a0
	add.a #1, 1
	mov.a #0, win1
	jmp win1
okay1 stp #1, #2
	stp #1, #3
;	jmp war1	
war1 mov.ba a2, exec
	jmp exec
table2 seq #18, a2
	jmp round2
	slt.b a3, #27
	jmp okay2
ko2	stp #1, #1
	stp #1, #2
	stp #1, #3
	jmp w1
round2 add #1, a2
       mov.ba a2, 1
	stp #0, #2
	seq #1, a0
	jmp notwin2
win2	add #3, a3
	mov.ba a3, 1
	stp #0, #3
	jmp pThink
notwin2 seq #0, a0
	add.a #1, 1
	mov.a #0, win2
	jmp win2
okay2 stp #1, #2
	stp #1, #3
;	jmp pThink

pThink: ldp.a  #0,             #1
        ldp.a  #pKey,          pVect
        add.a  pThink,         pMod
pMod:   mod.a  #13,            pVect
        stp.b  *pVect,         #pKey

                                    ;  STATE  LOSE  WIN  TIE  COPY
pVect:  jmp    }0,             1148 ;  (0)    4     0    8    (1)
        dat    cloner,         1149 ;  (1)    5     1    9    (2)
        dat    cloner,         1150 ;  (2)    6     2    10   (3)
        dat    cloner,         1151 ;  (3)    7     3    11   (4)
        dat    clp,            1230 ;  (4)    8     12   0    (1)
        dat    clp,            61   ;  (5)    9     5    1    (2)
        dat    clp,            2012 ;  (6)    10    10   2    (3)
        dat    clp,            843  ;  (7)    11    3    3    (4)
        dat    front,          2318 ;  (8)    4     8    8    (1)
        dat    front,          2319 ;  (9)    5     9    9    (2)
        dat    front,          2320 ;  (10)   6     10   10   (3)
        dat    front,          2321 ;  (11)   7     11   11   (4)
        dat    clp,            1713 ;  (12)   10    5    3    (test)

        dat    cloner,         1148 ;  (13)   unreachable
        dat    cloner,         1148 ;  (14)   unreachable

exec		jmp.a 0, }0
		jmp w1
		jmp w2
		jmp w3
		jmp w1
		jmp w3
		jmp w2
		jmp w2
		jmp w1
		jmp w3
		jmp w2
		jmp w1
		jmp w1
		jmp w2
		jmp w1
		jmp w3
		jmp w2
		jmp w1
		jmp w2

end start
