;redcode-94
;name	MC#4 Oneshot
;author Neogryzor
;assert CORESIZE==8000 && MINDISTANCE==2000
;strategy	0.5c oneshot -> bidirectional DAT-clear

	STEP EQU 17*5

LOOP:	ADD #STEP,#REF+STEP
SCAN:	JMZ.F @SETP,@LOOP
SETP:	MOV.BA @0,LOOP
REF:	SPL #0,0
FWCL:	MOV BMB,>LOOP
BWCL:	MOV BMB,{LOOP
BMB:	DAT -80,80

	END SCAN
