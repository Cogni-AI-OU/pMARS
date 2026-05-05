;redcode-94
;name Dumb25
;author Zul Nadzri
;strategy Decode this fast and you will win
;strategy Otherwise let me enjoy the ride
;assert 1

w1 equ imp
w2 equ gate
w3 equ clear

gate: jmp #0,<-3
ptr equ clear-3
clear: mov bmb,}ptr ;<-- must start here
mov bmb,}ptr
jmp -2
bmb: dat 7,0
imp: mov.i #4,1
start		ldp #0, #0
		ldp.a #1, exec	;prev warrior
adjust	sne.a #25, exec
		mov.a #0, exec
		add.a #1, exec
	      stp.ab exec, #1
		jmp @exec
exec		jmp.a 0, }0
		jmp w1
		jmp w2
		jmp w3
		jmp w1
		jmp w3
		jmp w2
		jmp w2
		jmp w1
		jmp w3
		jmp w2
		jmp w1
		jmp w1
		jmp w2
		jmp w1
		jmp w3
		jmp w2
		jmp w1
		jmp w2
		jmp w3
		jmp w3
		jmp w2
		jmp w1
		jmp w2
		jmp w1
		jmp w3
end start
