stomp mov	#0, -1
; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode
jmp	-1
sting2 spl	stomp
loop add	#8, cell
jmz	loop, @cell
add	sting2, @cell
jmp	loop
cell dat	#0, #4912
         end  sting2
