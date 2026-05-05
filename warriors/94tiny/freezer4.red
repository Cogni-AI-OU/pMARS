;redcode-94
;name	Freezer4
;author G.Labarga
;assert CORESIZE==800
;strategy	carpet-bombing scanner

	S EQU 15 ;45 ;16 ;70
	D1 EQU S
	D2 EQU S+5

pt:	mov INC,}700
LOOP:	MOV.I INC,>pt ;PTR
SCAN:	SEQ.I D1,D2		;<- Ref
PTR:	MOV.AB SCAN,pt ;#600 ;267
NEXT:	SUB.F INC,SCAN
	JMN.A LOOP,SCAN
;DJN NEXT,#3
INC:	SPL #-S,-S
	mov dbm,>-9
	djn.f -1,>-10
	dat <267,14
dbm:	dat <267,14

	END SCAN

