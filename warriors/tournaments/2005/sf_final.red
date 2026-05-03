;redcode
;name 8 mins until victory
;author S.Fernandes
;strategy last minute entry!

;assert CORESIZE == 8000

        org     paper

sdista  equ     560
sdistb  equ     1430
sdistc  equ     -1210
ddist   equ     -152

        for     90
        dat     0           ,    0
        rof

paper   spl     1           ,    {1555
        spl     1           ,    {1666

silka   spl     @0          ,    }sdista
        mov     }silka      ,    >silka
        mov     }silka      ,    >silka

silkb   spl     @0          ,    }sdistb
        mov     }silkb      ,    >silkb
        mov     {silkb      ,    {silkc
silkc   djn.f   sdistc+4    ,    {ddist

        dat     1           ,    1

        for     300
        dat     0           ,    0
        rof

        end
