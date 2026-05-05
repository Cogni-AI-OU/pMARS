nimbus dat	#0, #801
start add	#200, nimbus
mov	stone, @nimbus
mov	hail, <nimbus
spl	@nimbus
jmp	start
hail add	#1691, -1
stone djn	-1, @-2
         end    start
