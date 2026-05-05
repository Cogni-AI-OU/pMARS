;    bruin
; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode
;    by alan wang
;    and john perry
;
bruin mov	#-1, sbeg
mov	#-128, dbeg
mov	#14, left
again mov	<sbeg, <dbeg
djn	again, left	;  copy wang 1
spl	attack	;  and spawn
jmp	(bruin-128)
attack mov	#3, baddr	; do some bombing
mov	#107, bleft
bagain mov	bomb, @baddr
add	#1, baddr
djn	bagain, bleft
jmp	bruin	; then start over
dbeg dat	#0, #0
sbeg dat	#0, #0
left dat	#0, #0
bomb dat	#0, #0
baddr dat	#0, #0
bleft dat	#0, #0
       end     bruin
