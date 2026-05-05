; power bomb
; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode
;
; author: bram cohen
;
glance add	#412, outptr
start jmz	glance, @outptr
noop jmp	noop+1, 0
;
add	#9, outptr
mov	#0, jmptrap
sub	outptr, jmptrap
jmp	1, 0
sub	#11, jmptrap
mov	jmptrap, @outptr
mov	#17, count
bomb mov	noop, <outptr
djn	bomb, count
add	#420, outptr
jmp	start, 0
;
help mov	datbomb, <bombptr
jmp	help, 0
;
enter mov	jump, start
jmp	1, 0
spl	0, 0
dec djn	split, foes
;
mov	datbomb, split
count dat	#0, #0
datbomb dat	#0, #-bombptr+help
split spl	dec, 0
mov	datbomb, <bombptr
jmp	split, 0
foes dat	#0, #64
outptr dat	#0, #802
bombptr dat	#0, #glance
jump jmp	help-start, 0
jmptrap jmp	@jmptrap, #jmptrap
         end    start
