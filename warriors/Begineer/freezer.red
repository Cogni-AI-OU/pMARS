;REDCODE-94
;NAME 	Freezer
;AUTHOR Neogryzor <----@mixmail.com>
;ASSERT CORESIZE==800

;STRATEGY	Tiny multi-shot scanner
;STRATEGY	(Tiny Neoshot)

	S EQU 2*12	;(mod4 scan)
	D1 EQU 2*12+1
	D2 EQU 2*12+5
	N EQU 99

DIR:	DAT 400,0
	DAT 0,0
LOOP:	SUB.F STEP,SCAN
START:	MOV.I STEP,}DIR
SCAN:	SEQ.I D1,D2		;<- Ref (+1)
	MOV.A SCAN,DIR
	DJN LOOP,#N
STEP:	SPL #-S,<-S		;Core clear + Imp gate
	MOV.I 1,<-2

	END START

