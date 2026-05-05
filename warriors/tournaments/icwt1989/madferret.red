;
; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode
; mad ferret
;
; by mark a. durham
;
; january 22, 1990
;
; based on ferret by rober r. reed, iii.
;
start cmp	<here, <there
mov	trap, @there
cmp	<here, <there
here mov	trap, start
jmn	start, there
loop mov	kill, <kill
djn	loop, <kill
trap spl	trap
kill dat	#0, #loop
there dat	#0, #4096
            end       start
