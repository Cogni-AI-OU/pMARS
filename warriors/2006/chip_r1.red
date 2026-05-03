;redcode-CDEC2006
;name Whole Cloth
;author Chip Wendell
;strategy basic 6-process paper
;strategy adapted from my entry for CSEC2005 final
;assert (CORESIZE==7919) && (MAXPROCESSES==50)
;assert (MAXCYCLES==79000) && (MAXLENGTH==100)
;assert (MINDISTANCE==100)

pAway1 equ 1237
pAway2 equ 489
bStep1 equ 829
bStep2 equ 1491

start  spl     2                     ;
       spl     1                     ;
       spl     1                     ;generate 6 parallel processes
silk1  spl.a   @0,     pAway1        ;split  
       mov.i   }silk1, >silk1        ;copy    ---> front-end silk
       mov.i   #1, {1
       mov.i   {bStep1, <bStep2
       mov.i   {silk1, <silk2        ;copy
silk2  jmp     @0,     >pAway2       ;jump    ---> back-end silk

       end
