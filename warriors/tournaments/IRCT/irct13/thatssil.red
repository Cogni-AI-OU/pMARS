;redcode
;name That's silly
;author Lukasz Adamowski
;assert 1

boot mov start, start+2520/2+4
FOR 5
mov }boot, >boot
ROF
spl start+2520/2+4
start spl #0, -1
mov 3, <-1
mov 2, <-2
jmp -3, <-3

end boot
