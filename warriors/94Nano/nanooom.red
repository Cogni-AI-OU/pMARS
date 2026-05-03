;redcode-nano
;name Nanooom
;author neo
;strategy nano version of Zooom
;assert 1

loop2:	mov -1,<setp
loop1:	add #5,#10
scan:	jmz.b *mdfy,@loop1
setp:	mov.b loop1,#0
mdfy:	djn.a loop1,>0

end scan
