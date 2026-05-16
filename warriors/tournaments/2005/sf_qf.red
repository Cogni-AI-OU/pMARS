;redcode-94
;name Sandpaper
;author S.Fernandes
;strategy paper/imp

;assert CORESIZE == 8000

        org     paper

idist   equ     2667
sdista  equ     563
sdistb  equ     2930
sdistc  equ     idist+1

paper   spl     1           ,    {5555
        spl     1           ,    {4444
        spl     1           ,    {3333
        mov     {silka      ,    {boot
boot    spl     silka+2008  ,    {2222

silka   spl     @0+8        ,    }sdista
        mov     }silka      ,    >silka
silkb   spl     @0          ,    }sdistb
        mov     }silkb      ,    >silkb
silkc   spl     @0          ,    sdistc
        mov     }silkc      ,    >silkc
        spl     -1          ,    <1111
imp     mov.i   #idist      ,    *0
        end
