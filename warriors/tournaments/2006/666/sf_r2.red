;redcode
;name no hope
;author S.Fernandes
;strategy imp spiral
;round Round 2 entry (identical to nohope.red)
;assert (CORESIZE==666) && (MAXPROCESSES==6)
;assert (MAXCYCLES==6666) && (MAXLENGTH==16)
;assert (MINDISTANCE==16)

; I didn't see the rules until last minute but I'll
; enter something quick just in case Sascha doesn't
; send anything. Otherwise, I don't stand a chance.

        org     launch

istep   equ     533

        dat     1           ,    imp+5*istep
        dat     1           ,    imp+4*istep
        dat     1           ,    imp+3*istep
launch  spl     2           ,    {imp+2*istep
        spl     1           ,    {imp+1*istep
vector  spl     1           ,    imp+0*istep
        djn.a   @vector     ,    #616

        for     8
        dat     0           ,    0
        rof

imp     mov.i   #istep      ,    *0

        end
