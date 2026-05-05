;redcode-tiny
;name
;author G.Labarga
;assert CORESIZE==800
;strategy P-warrior:paper and bomber
;strategy Unfortunately it switches to paper when the bomber ties
;strategy Cannot write a pure SOL in 4 lines :(
;strategy Anyway it should score better against papers...
;conmuta a 0 si el estado 1 empata

dest1 equ 4110
dest2 equ 5756

paper:	spl 1
	spl 1
	spl @0,>dest1
	mov }-1,>-1
	mov {-2,{1
	jmp *dest2,<dest2-4

; switch on loss, state 0 on tie
state	equ	(paper-250)

think:	ldp	}state	,	state
	ldp.ab	state	,	@state
	stp.a	@state	,	<state+1
	jmn.b	paper	,	@state+1

;--- ZXC---
step equ 705
d1 equ hit+(1*step)
d2 equ hit+(2*step)
gate equ (paper-3)	;(loop-3)
cnt equ 53
decoy equ bmb-308

loop:	mov bmb,@ref
	mov bmb,*ref
ref:	mov d1,*d2
	sub.f inc,ref
hit:	djn.b loop,#cnt
inc:	spl #(-3*step),>(-3*step)
	mov cbm,>gate
	djn.f -1,>gate
cbm:	dat >267,(1-gate)
bmb:	mov step,1

end think
