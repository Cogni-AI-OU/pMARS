; quick sand ii
; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode
;
; by norman richards
;
bomb spl	bomb
dat1 dat	#0, #20
num dat	#0, #470
inc dat	#0, #17
numsave dat	#0, #470
outerloop dat	#0, #8
;
start spl	part2
part1 add	inc, dat1
mov	bomb, @dat1
djn	part1, num
add	#20, inc
sub	#50, numsave
mov	numsave, num
mov	#20, dat1
djn	part1, outerloop
mov	#470, numsave
mov	numsave, num
mov	#17, inc
mov	#18, outerloop
jmp	part1
part2 cmp	@point1, @point2
jmp	ne
mov	pabomb, @point1
mov	pabomb, @point2
ne cmp	<point1, <point2
mov	point2, point1
jmz	point2, part2
mov	#-40, point1
mov	point1, point2
jmp	part2
pabomb dat	#0, #0
point1 dat	#0, #-40
point2 dat	#0, #-40
             end    start
