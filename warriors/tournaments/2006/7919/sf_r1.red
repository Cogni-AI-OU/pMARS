;redcode
;name Chrysalid
;author S.Fernandes
;strategy running out of time and still nothing written, so
;strategy Zul might recognise this paper from CWSET 2005 :)
;assert (CORESIZE==7919) && (MAXPROCESSES==50)
;assert (MAXCYCLES==79000) && (MAXLENGTH==100)
;assert (MINDISTANCE==100)

       org     paper

sdista  equ     989
sdistb  equ     2309
sdistc  equ     -469
ddist   equ     -102

paper   spl     1           ,    {5108
       spl     1           ,    {1488

silka   spl     @0          ,    }sdista
       mov     }silka      ,    >silka
       mov     }silka      ,    >silka

silkb   spl     @0          ,    }sdistb
       mov     }silkb      ,    >silkb
       mov     {silkb      ,    {silkc
silkc   djn.f   sdistc+4    ,    {ddist

       dat     <5280       ,    <2640
       end
