;REDCODE-94
;NAME 	Mad pixel C2
;AUTHOR G.Labarga
;ASSERT CORESIZE==800
;strategy	Paper eating oneshots
;strategy	Qbomb->paper
;strategy	2c Qbomb, (1c bomb + 1c dec)
;strategy	The Qbomb helps a lot against those nasty tiny-oneshots
;strategy	And placed in front of the warrior scores better
;*** probar con Qscan, (Rasp u otros)

	DEST1 EQU 484
	DEST2 EQU 290

PLCH:	SPL 1,{QBOMB+40+24*23
	SPL 1,{QBOMB+40+25*23
PBOT:	SPL PAP1+404,PAP1
	MOV >PBOT,}PBOT
PAP1:	SPL @0,>DEST1
	MOV }PAP1,>PAP1
	MOV {PAP1,{PAP2	;<PAP2
PAP2:	DJN.F *DEST2,<110

QBOMB:				;The Quick punch :)
I FOR 11
	MOV.I {QBOMB+40+I*23,{QBOMB+40+(I+11)*23
ROF
	JMP PLCH,{QBOMB+40+23*23

	END QBOMB
