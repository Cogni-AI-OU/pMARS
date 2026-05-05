;corwar-program 'tank' , slitting/doubling 0-werfer
;(c) 4/89 detlef bunk, norderneyweg 5, d-43 essen
;    ergaenzte version
jmp	start	; only for start, ommited in further copies
ptr dat	#0, #27	;program length -1,care if change program!
start mov	#0, @bomb	;shoot backwd 0-bomb
mov	#0, @bombv	;shoot forwd  0-bomb
sub	#9, bombv	;decrement forwd-bomb, defines forwd bombarea
add	#9, bomb	;increment backwd-bomb, defines backwd bombarea
djn	start, count	;decrement bombcounter
jmp	newc
newc jmz	asave, 384	;check adr. before new copyfield enemy prgr instruct?
add	#256, new	;if yes, i.e. non-zero, increment adr. for new copy
asave jmz	save, @new	;test 1. adr. of copyfield if yes, increment copyadr
add	#783, new	;
save mov	#41, count	;restore bmb-counter
mov	#-47, bombv	;restore 1st bmb-adr
mov	#32, bomb	;restore 1st bckwd-bmb-adr
copy mov	@ptr, @new	;start copyloop
sub	#1, new	;decrement copy-adress counter
djn	copy, ptr
jmp	ready
ready mov	#27, ptr	;restore copypointer
mov	ptr, @new	;copy copypointer to new program
add	#2, new	;increment for jmp to 'start'label of new copy
spl	@new	;invoke new progr.
add	#2800, new	;adr. for next copy to get out of own bomb-area
jmp	start	;once again
new dat	#0, #544	;adr for new copy out of own bomb-area
count dat	#0, #41	;num of bombs
bomb dat	#0, #32	;adr. of 1. backwd-bomb
bombv dat	#0, #-47	;adr. of 1. forwd-bomb,not lower than progr.-length!
;program firstly throws 'count' 0-bombs foreward and backward.
;then it looks for a safe place for a new copy, checking copyarea for other
;enemy- or own program instruction to find a field which is
;filled with 0-data. first check is made far enough ahead of the eventual
;copyarea to detect 'mov 0 1'-aggressors, which can disturb the copyprocess.
;distance must fit that the last backward-bomb of the old program
;and the last foreward-bomb of the new program cannot destroy each other.
;the second check looks for the same but checks exactly for 0 the adress of
;the first potentially copied instruction. if either check is negativ
;new copyarea is computed by decrementing copyadress.
;then copy starts by risk of destroying own old programs or by chance
;writing over enemy programs.
; the bombed area depends on number and distance of thrown bombs.
;it should not overlap, so that there's no risk to destroy each other
;in the beginning of the battle during the first cycles. in the further course
;of the battle it is inevitable. but this has the advantage that not too many
;copys are alive. a medium amount of copys can throw more bombs as if every
;new program is occupied by copying itself.