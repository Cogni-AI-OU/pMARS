;  killer 2     by thm
; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode
;
jmp	start
ptr1 dat	#0, #111
ptr2 dat	#0, #11
ptr3 dat	#0, #5
start mov	#-250, ptr1
mov	#11, ptr2
mov	#8, ptr3
mov	<ptr3, <ptr1
djn	-1, ptr2
spl	-269
mov	0, 1
           end   start
