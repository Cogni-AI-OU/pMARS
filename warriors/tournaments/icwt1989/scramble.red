;
; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode
; scrambler
;
; by mark a. durham
;
; january 22, 1990
;
start mov	<here, <there
mov	<there, <here
jmn	start, there
wait spl	wait, 0
here jmp	wait, #start
there dat	#0, #4092
           end       start
