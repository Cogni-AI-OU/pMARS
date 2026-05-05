;
;    Warrior: Spook
;  File name: spook.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: JOE E. ROBERTSON III / ESCONDIDO / CA / USA
;
GO       MOV    #25, GO
        ADD    5, GO
STOPIMP  MOV    #0, <PTR
        SUB    #5, PTR
        JMN    STOPIMP, PTR
START    SPL    STOPIMP, 0
PTR      DAT    <0, <-5
	END     START
