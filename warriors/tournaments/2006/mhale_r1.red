;redcode
;name MyB1tch
;author Mike Hale
;strategy uhm...I don't really know.  Let me get back to you on that.

org start
start spl @0, 15
add #15, start
mov 4, 4
add.ab 	#15, start 
add.ab	#1, bomb
mov.i bomb, @bomb
jmp start

bomb:	dat #0, 0

end
