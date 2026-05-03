;redcode-94
;name Club
;author Heath Caldwell
;assert (CORESIZE==7919) && (MAXPROCESSES==50)
;assert (MAXCYCLES==79000) && (MAXLENGTH==100)
;assert (MINDISTANCE==100)

bskip  equ     84
mskip  equ     15

       org     split

bomb   dat     #0, #0
jump   dat     #0, #13
       dat     #0, #0

split  spl     bomber

start  mov.ab  #bskip, bomb
       mov.a   #1+last-bomb, bomb
copy   mov.i   {bomb, <bomb
       seq.i   bomb, *bomb
       jmp     copy
       add.ab  #3, bomb
       jmp     @bomb

bomber add.ab  #mskip, jump
       mov.i   bomb, @jump
last   jmp     bomber

       end
