;REDCODE-94
;NAME 	Radar-Z
;AUTHOR Neogryzor <----@mixmail.com>
;ASSERT CORESIZE==8000

;STARTEGY	0.75c Scanner: 0.5c scan + 0.25c bomb

	P EQU 95	;Paso relativo de rastreo
	S EQU 3*P	;Salto de rastreo
	I EQU 97	;Posición inicial 1
	N EQU 533	;Nº de pasadas

BMB:	SPL #P,#2*P
BUCLE:	MOV.I BMB,@SCAN
SCAN:	SEQ.I *I,@I		;<- Pos. 0, (-5,5,10)
	JMP ATACA
SIGUE:	ADD.F PASO,SCAN
	DJN BUCLE,#N
LIMPIA:	MOV.I -8,<-8
	DJN LIMPIA,#7988
	JMP LIMPIA,<LIMPIA
	DAT 0,0			;<-B
ATACA:	ADD.F SCAN,DIR
	MOV.I DIR,*DIR
	MOV.I DIR,@DIR
	JMP 2
	DAT 0,0			;<-B
	SUB.F SCAN,DIR
	JMP SIGUE
PASO:	DAT #S,#S
DIR:	SPL #SCAN+P,#SCAN+2*P

	END BUCLE

LIMPIA:	MOV.I TRAM,{TRAM
	JMZ LIMPIA,6		;DJN LIMPIA,#7990
	DAT 0,0			;<-B (SPL ...)
	MOV.I 1,{-1
	JMP -1,<-2
	