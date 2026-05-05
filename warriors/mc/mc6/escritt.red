;redcode-94
;name Doesn't Really Matter
;author Blake Escritt
;assert 1
;strategy My entry for Neogryzor's mini challenge #6
;strategy This warrior works on the assumption that I can't
;strategy outsmart a random switcher, but I can confuse an
;strategy adaptive switcher.
org think
think: ldp.a #1, choose ;Load the strategy value
add.a #1, choose ;Increment it
stp.ab choose, #1 ;Save it
mod.a #3, choose ;Normalize the result
choose jmp @0, imp ;A typical switching hub
dat #0, clear
dat #0, gate

imp: mov.i #4,1

ptr equ clear-3
clear: mov bmb,}ptr ;<-- must start here
mov bmb,}ptr
jmp -2
bmb dat 7,0

gate: jmp #0,<-3
end
