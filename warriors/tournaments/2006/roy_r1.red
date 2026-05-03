;redcode-94nop
;name Drop and listen
;author Roy van Rijn
;assert 1

ptr     dat     0               , sScan-8

       dat     0               , 0
       dat     0               , 0
       dat     0               , 0

sw      dat     1,      14
g2      spl     #96,    14
       dat     0,      0
       dat     0,      0
clr     spl     #sStep, sStep
       mov     *sw,    >ptr
       mov     *sw,    >ptr
       djn.f   -2,     }g2

for     4
       dat     0,      0
rof

for     11
       dat     0,      0
rof


sOff    equ     4201
sStep   equ     18
sDiff   equ     3991

pGo     add.f   clr,    sScan
       mov     sBomb,  *1
sScan   sne     }sOff,  >(sOff+sDiff)-7
       djn.f   pGo,    @-1
       add.b   sScan,  ptr
       jmp     clr,    <2533

for     5
       dat     0,      0
rof

sBomb   mov.i   sDiff,  {1

end pGo
