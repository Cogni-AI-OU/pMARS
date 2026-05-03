;redcode
;name MC#5 derivator
;author Lukasz Adamowski
;assert 1

ord	EQU	5
N	EQU	5


start	mul.ba	@c2,	@c2
	djn.b	$start,	>c2
	mov.f	$c1,	$c2
	djn	$start,	#N

	dat	-6,	5	;	coefficient (A-field) and power (B-field)
	dat	2,	4
	dat	-3,	3
	dat	0,	2
	dat	15,	1
	dat	-7,	0

c2	dat	0,	-ord-1
c1	dat	0,	-ord-1

	end	start
