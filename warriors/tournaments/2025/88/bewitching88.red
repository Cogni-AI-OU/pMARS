;redcode
;name Bewitching'88
;author S.Fernandes
;strategy scanner
;assert CORESIZE==8000

QGAP	equ	1168

qfirst	equ	(qp2+2*qstep)
qdist	equ	qfirst+QGAP
qstep	equ	(QGAP+QGAP)

qi	equ	5
qr	equ	10

qbomb	dat	<qi/2-qi*qr, <qi*qr-qi/2

qa	equ	qstep*16
qb	equ	qstep*5+2
qc	equ	qstep*10
qd	equ	qstep*2
qe	equ	qstep*1

qscan	cmp	qdist+qc, qfirst+qc
	jmp	qfast, <qa
	cmp	qdist+qe+qd, qfirst+qe+qd
qp1	jmp	<qfast, <qc
qp2	cmp	qdist, qfirst
qp3	jmp	qskip, <qe

	cmp	qdist+qb, qfirst+qb
q1	djn	qfast, #qp1

	cmp	qdist+qd+qc, qfirst+qd+qc
	jmp	qslow, <qfirst+qd+qc+4
	cmp	qdist+qd+qb, qfirst+qd+qb
x1	jmp	qslow, <q1
	cmp	qdist+qc+qc, qfirst+qc+qc
q2	djn	qslow, #qp2
	cmp	qdist+qd, qfirst+qd
	jmp	qslow, <qfast
	cmp	qdist+qa, qfirst+qa
	jmp	q1, <q1

	cmp	qdist+qa+qd, qfirst+qa+qd
	jmp	x1, <q1
	cmp	qdist+qc+qb, qfirst+qc+qb
	jmp	q2, <q1
	cmp	qdist+qe+qd+qc,qfirst+qe+qd+qc
	jmp	qslower, <qfirst+qe+qd+qc+4
	cmp	qdist+qd+qd+qc,qfirst+qd+qd+qc
q3	djn	qslower, #qp3

	jmz	warr, qdist+qe+qd+qc+10

qslower	add @q3, @qslow
qslow	add @q2, qkil
qfast	add @q1, @qslow

qskip	cmp <qdist+qstep+50, @qkil
	jmp	qloop, <1234

	add	#qdist-qfirst, qkil
qloop	mov qbomb, @qkil
qkil	mov <qfirst+qstep+50, <qfirst
	sub #qi, @qloop
	djn qloop, #qr+2

warr    mov    <cleanup+1   ,   <bboot
        mov    <cleanup+1   ,   <bboot
        mov    <cleanup+1   ,   <bboot
        mov    <cleanup+1   ,   <bboot
        mov    <cleanup+1   ,   <bboot
        mov    <cleanup+1   ,   <bboot
        mov    <cleanup+1   ,   <bboot
        mov    <cleanup+1   ,   <bboot
        mov    <cleanup+1   ,   <bboot
bboot   jmp    @bboot       ,   2254

step    equ    4684

eye     mov    slow         ,   <hit+step
scan    add    #step        ,   eye
        jmz    scan         ,   @eye
hit     mov    @jump        ,   @eye
        jmn    eye          ,   hit

slow    spl    0            ,   <clear-11
clear   mov    cleanup      ,   <clear-6
jump    jmp    clear        ,   0

cleanup dat    <2667        ,   <-11

        end    qscan
