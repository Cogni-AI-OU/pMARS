;
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
