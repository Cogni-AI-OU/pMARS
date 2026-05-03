;redcode-94nop
;author inversed
;name Odd Warfare
;strategy Datagram 2006 spring tournament round 1 entry
;assert 1

cptr	equ	(s0-3)
hop	equ	2360
step	equ	hop*2
zofs	equ	(jl-step*time)
time	equ	800

istep	equ	3960
idist	equ	813
is2	equ	407
id2	equ	500

x0	equ	s0
org	start

s0	spl	#hop,	1
loop	add	#step,	ptr
ptr	mov	bj,	}zofs
	mov	s0,	@ptr
jl	jmp	loop,	0
	mov	kill,	>cptr
	djn.f	-1,	>cptr
	jmp	{0,	}0
bj	jmp	#1,	1
	dat	0,	0
kill	dat	0,	16

	for	81
	dat	0,	0
	rof

imp	mov.i	#is2,		istep

start	spl	s0,	0
vec	mov	imp,	x0+idist+0*istep
	spl	1,	x0+idist+1*istep
	spl	1,	0
	spl	2,	0
	jmp	>vec,	0
	jmp	>vec+1,	0

       end
