;name Mice
;author CODEX
;strategy Replicator
ptr DAT #0, #0
start MOV #12, ptr
loop MOV @ptr, <dest
DJN loop, ptr
SPL @dest, #0
ADD #653, dest
JMZ start, ptr
dest DAT #0, #833
