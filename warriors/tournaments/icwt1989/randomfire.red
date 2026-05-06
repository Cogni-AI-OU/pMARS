;random fire
; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode
;
; author: bram cohen
;
;
nextadd add	#412, ptr
start jmz	nextadd, @ptr
mov	datzero, @ptr
jmp	nextadd
ptr dat	#0, #799
datzero dat	#0, #0
           end    start
