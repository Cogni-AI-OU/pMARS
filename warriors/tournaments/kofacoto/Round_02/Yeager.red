;redcode
;name Kofacto Warrior
;author Josh Yeager
;assert 1
;startegy The best I could do with '88 in a day.

	spl dec
bom	mov bomb,<dec
	jmp bom,<-8
dec	jmp 0,<-5
bomb	dat #0,#-5 
