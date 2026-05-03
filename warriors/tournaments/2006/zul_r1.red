;redcode-CSEC2006
;name noTime
;author Zul Nadzri
;assert (CORESIZE==7919) && (MAXPROCESSES==50)
;assert (MAXCYCLES==79000) && (MAXLENGTH==100)
;assert (MINDISTANCE==100)

;strategy - After some thinking, I concluded this round is too sharp. 
;strategy - The key is guessing the opponent strategy correctly.
;strategy - I assume that at low process, a scanner is excellent.
;strategy - But that scanner is beaten by many other scanners.
;strategy - Now, I am back to square one.
;strategy - The above comments copied from previous submission...still valid :)
;strategy - Let's go with a silk. Of course, silk's weaknesses are well known.

	ORG warrior
TSTEP equ 2637  	;4713
CSTEP equ 2275  	;2275
NSTEP equ -7714	
FSTEP equ 229	;7657	
tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {-FSTEP,        <FSTEP
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP
st for 82
        dat.f   0,              0
rof
warrior
        spl     1,              <-200		;-200
        spl     1,              <-300		;-300
        mov.i   -1,             0
        spl     tim1,           <-400		;-400
tim2    spl     @tim2,          }TSTEP
        mov.i   }tim2,          >tim2
cel2    spl     @cel2,          }CSTEP
        mov.i   }cel2,          >cel2
        mov.i   <-FSTEP,        {FSTEP
        mov.i   {cel2,          <ncl2
ncl2    jmp     @ncl2,          >NSTEP
	end
