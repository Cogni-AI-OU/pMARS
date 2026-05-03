;REDCODE-94
;NAME 	DIMP5
;AUTHOR Neogryzor <neogryzormail@mixmail.com>
;ASSERT CORESIZE==8000

;STRATEGY	3pt self-moving bomber (2 proc)

	STEP EQU 2668

START:	SPL 1
	SPL A
	SPL C
B:	SPL 1
	JMP INI+STEP
C:	SPL 1
	JMP INI+2*STEP
A:	SPL 1
	JMP INI
PTR:	MOV.I #0,STEP		;Pointer
INI:	MOV.I }PTR,>PTR		;Copy
	MOV.I >1200,>2000	;}PTR,>PTR
	MOV.I >800,>1601	;Attack

	END START
