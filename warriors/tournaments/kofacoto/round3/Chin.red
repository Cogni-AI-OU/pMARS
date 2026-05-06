;redcode
;name Voodoo
;Author Jeremy Chin
;strategy Undisclosed
;assert 1 ; Added to avoid pMARS warning

start:
add #4,1
add #4,4
cmp 5,8
jmp 2
jmp start
jmp 4
end start
