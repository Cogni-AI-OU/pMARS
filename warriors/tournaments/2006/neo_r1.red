;redcode
;name blhoddvsd
;author G.Labarga
;assert 1

istep equ 3960
dest equ 7716   ;1135
trail equ 4812  ;-135
bstep1 equ 1171
bstep2 equ 826

start:  spl @dest,>last+1
       sub.x last,start
loop:   mov <start,{start
       mov.i {bstep1,{bstep2
       add.f {0,}0
       jmn loop,start
last:   djn.f start,<trail
for 30
       dat 0,0
rof
iloc equ sta+3900
sta:    spl loop
       spl loop2
       mov imp,iloc
       spl 1
       spl 1
       spl 2
first:  jmp >0  ,#iloc+(0*istep)
       jmp >0  ,#iloc+(1*istep)
imp:    mov.i #3,istep
for 30
       dat 0,0
rof
dest2 equ 7841 ;-1300   ;1135
trai2 equ 4067 ;2100    ;-135
atk equ 3930 ;-476

star2:  spl @dest2,>last2+1
       sub.x last2,star2
loop2:  mov <star2,{star2
       mov.i bmb,>atk
       jmn loop2,star2
last2:  djn.f star2,<trai2
bmb:    dat <3960,<2640
end sta
