;redcode-CSEC
;name Lavos7919
;author Nenad Tomasev
;assert 1

istep equ 2640
ioff equ 789
ibd equ 631
sbd equ 3851
c equ 1872

step equ 4427
ini equ (step+2)
ds equ 3260

zero equ qbomb
qtab3 equ qbomb

	org qgo
qbomb   dat >qoff, >qc2
boot	mov imp, (imp+ibd+ioff)
	spl 1, {qb1
qtab2	spl 1, {qb2
	spl 2, {qb3
	mov {boot, {igo
	mov <sbomb+1, {sgo
sgo	djn.b (sbomb+1+sbd), #4
igo	djn.f (imp+ibd), {c
	for 8
	dat 0, 0
	rof
        dat zero-1, qa1
qtab1   dat zero-1, qa2
	for 5
	dat 0, 0
	rof
stone	spl #-3*step, >-3*step
	mov.i sbomb, @shoot
	sub.f stone, @-1
shoot	mov.i }ini, }ini+step
	djn.f (stone+1), <ds
	for 2
	dat 0, 0
	rof
sbomb	dat >step, >1
	for 3
	dat 0, 0
	rof
pump	spl #imp+ioff, #imp+1+ioff
	sub.f #-istep-1, leap
	mov imp+ioff, }pump
leap	jmp ((imp-2*(istep+1))+ioff), }(((imp+2*istep)-1+ioff)-500)
imp	mov.i #istep, *0
	for 25
	dat 0, 0
	rof

qc2 equ ((1+(qtab3-qptr)*qy)%CORESIZE)
qb1 equ ((1+(qtab2-1-qptr)*qy)%CORESIZE)
qb2 equ ((1+(qtab2-qptr)*qy)%CORESIZE)
qb3 equ ((1+(qtab2+1-qptr)*qy)%CORESIZE)
qa1 equ ((1+(qtab1-1-qptr)*qy)%CORESIZE)
qa2 equ ((1+(qtab1-qptr)*qy)%CORESIZE)
qz equ 2086
qy equ 241         ;qy*(qz-1)=1

qgo     sne qptr+qz*qc2, qptr+qz*qc2+qb2
        seq <qtab3, qptr+qz*(qc2-1)+qb2
        jmp q0, }q0
        sne qptr+qz*qa2, qptr+qz*qa2+qb2
        seq <qtab1, qptr+qz*(qa2-1)+qb2
        jmp q0, {q0
        sne qptr+qz*qa1, qptr+qz*qa1+qb2
        seq <(qtab1-1), qptr+qz*(qa1-1)+qb2
        djn.a q0, {q0
        sne qptr+qz*qb3, qptr+qz*qb3+qb3
        seq <(qtab2+1), qptr+qz*(qb3-1)+(qb3-1)
        jmp q0, }q1
        sne qptr+qz*qb1, qptr+qz*qb1+qb1
        seq <(qtab2-1), qptr+qz*(qb1-1)+(qb1-1)
        jmp q0, {q1
        sne qptr+qz*qb2, qptr+qz*qb2+qb2
        seq <qtab2, qptr+qz*(qb2-1)+(qb2-1)
        jmp q0
        seq >qptr, qptr+qz+(qb2-1)
        jmp q2, <qptr
        seq qptr+(qz+1)*(qc2-1), qptr+(qz+1)*(qc2-1)+(qb2-1)
        jmp q0, }q0
        seq qptr+(qz+1)*(qa2-1), qptr+(qz+1)*(qa2-1)+(qb2-1)
        jmp q0, {q0
        seq qptr+(qz+1)*(qa1-1), qptr+(qz+1)*(qa1-1)+(qb2-1)
        djn.a q0, {q0
        jmz.f boot, qptr+(qz+1)*(qb2-1)+(qb2-1)

qoff equ -86
qstep equ -7
qtime equ 19

q0      mul.b *2, qptr
q2      sne {qtab1, @qptr
q1      add.b qtab2, qptr
        mov qtab3, @qptr
qptr    mov qbomb, }qz
        sub #qstep, qptr
        djn -3, #qtime
        djn.f boot, #0
	end
