;redcode-94
;name Suicidal
;author Neogryzor
;assert CORESIZE==8000
;strategy	MC#4 suicidal 0.5c bomber

	STEP EQU 17*5
	FIRST EQU 2*STEP+1

LOOP:	MOV BM,@REF
REF:	MOV BM+1,@FIRST	
	ADD #2*STEP,REF
	JMP LOOP
BM:	DAT 0,5

	END LOOP
