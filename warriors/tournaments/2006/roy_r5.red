;redcode-94nop
;name Ministrom
;author Roy van Rijn
;strategy Noble Fluffy is my Hero
;assert 1

bDist1  equ     996
bDist2  equ     2354

pGo     spl     1               , <3452
qtab2   spl     1               , <7434
       spl     1               , <2355

       mov     {pap2           , {1
pBoot1  spl     bDist1          , }5747

       mov     {pap            , {1
pBoot2  djn.f   bDist2          , }4584

for     5
       dat     0               , 0
rof

iStep   equ     4000/7
pStep   equ     692;7342
sStep   equ     121;5965


pap2    spl     @8              , <pStep
       mov.i   }-1             , >-1
pStone  spl     #0
       mov     bomb            , >ptr
       add.x   imp             , ptr
ptr     jmp     imp-iStep*8     , >sStep-6
bomb    dat     >1              , }1
imp     mov.i   #sStep-1        , iStep


for     3
       dat     0               , 0
rof

nstep1  equ     2413/2
cstep1  equ     4704/2
tstep1  equ     3278/2

pap     spl     @8      , }tstep1
       mov.i   }-1     , >-1
nothA   spl     cstep1  , 0
       mov.i   >-1     , }-1
nothB   spl     @0      , }nstep1
       mov.i   }-1     , >-1
       mov.i   #1138   , <1
       djn.b   -2      , #1618

end pGo
