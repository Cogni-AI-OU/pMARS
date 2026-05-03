;redcode
;name REH SUBMA!!!
;author
;assert 1
;strategy Unfortunately there is no time for a p-spacer
;strategy so i go with just a couple of anti-imp papers

dest1 equ 838
dest2 equ 7264
dest3 equ 6623
dest4 equ 2972
istep equ 2667

bp:	spl 2,>-80
	spl 1,}-86
	spl 1,<-92
	spl pap2,{-98
pap1:	spl @0,>dest1
	mov }-1,>-1
	mov bmb,>bmb+dest1-5334-2
	mov bmb,>bmb+dest2-5334-2
	mov {-4,{1
	jmz.a *dest2,*0
for 24
	dat 0,0
rof
bmb:	dat >2667,>5334
for 9
	dat 0,0
rof
pap2:	spl @0,>dest3
	mov }-1,>-1
	mov bmb,>bmb+dest3-5334-2
	mov bmb,>bmb+dest4-5334-2
	mov {-4,{1
	jmz.a *dest4,*0

end bp
