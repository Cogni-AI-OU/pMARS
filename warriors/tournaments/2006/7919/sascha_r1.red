;redcode-x
;name Sinnloser Name
;author Sascha Zapf
;strategy Shameless stolen Leaps from Fizmo
;strategy but hope that the name has enough power against Jens' warriorname

;assert (CORESIZE==7919) && (MAXPROCESSES==50)
;assert (MAXCYCLES==79000) && (MAXLENGTH==100)
;assert (MINDISTANCE==100)

sOff    equ  3507
sStep   equ  1605

sGo     add.f  sTab,     sLook
       sne    *sLook,   @sLook
       add.f  sTab,     sLook
sLook   sne    sOff+10,  sOff
       djn.f  sGo,      <6431
         add.ab #-15,     sLook
       mov    <burger,  <sLook
       mov    <burger,  <sLook
       mov    <burger,  <sLook
       djn    -2,       #4
       add.ab #5,       sLook
       spl    @sLook
       mov    burger+1, sLook
sTab    dat    #sStep,   <sStep

   for 50
       dat    0,        0
   rof

gate    dat    3970,     18
jumper  jmp    3970,     18
       dat    0,        0
       dat    0,        0
       jmp    -400,     <-200
clear   spl    #4600,    18
       mov    @switch,  >gate
       mov    jumper,   }gate
switch  djn    clear+1,  {clear

burger  dat    0,        0

end
