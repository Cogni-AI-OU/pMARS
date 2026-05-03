;REDCODE-94
;NAME 	BM-Gen2
;AUTHOR Neogryzor <neogryzormail@mixmail.com>
;ASSERT CORESIZE==8000

;STARTEGY	stone + D-clear, (paper detection)
;		0.8: 0.6c bombing + 0.2c linear dec(DJN)
;		Fast BMZ-Generation 2

	LOCT EQU 2000
	EXEC EQU 2000-11+3
	STEP EQU 76		;(mod4)

BOOT:	MOV.I <SOURCE,<SPLIT		;12 ins
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT
	MOV.I <SOURCE,<SPLIT

SPLIT:	SPL EXEC,LOCT
	SUB.F -1,-1			;Erase pointers

INC:	DAT #3*STEP,#3*STEP
BMB:	DAT <4,<8			;<-Hit
BM1:	DAT <30,<0
BM2:	SPL #30,<-1
LOOP:	MOV.I BMB,*REF
	MOV.I *-1,@REF			;<-Hit
REF:	MOV.I 1*STEP-1,@2*STEP-1
	ADD.F INC,REF
	DJN *-3,<-3000
CLEAR:	MOV @0,<BM2			;D-clear
	DJN -1,}BM2
	JMP CLEAR,<-20

SOURCE:	DAT 0,0

	END BOOT
