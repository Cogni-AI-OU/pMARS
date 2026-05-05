;name StoneSPL
;author CODEX
;strategy Split bomber with wide step
SPL 0
loop MOV bomb, @ptr
ADD #3039, ptr
JMP loop
bomb DAT #0, #0
ptr DAT #0, #0
