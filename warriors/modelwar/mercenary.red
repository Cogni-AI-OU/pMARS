;redcode-modelwar
;name Mercenary
;author John Metcalf
;strategy paper with silk-imps
;assert 1

        pstepa equ -13424
        pstepb equ -3656
        off    equ 13340

warr    spl    2,            {22300
        spl    1,            {22400
        spl    1,            {22500
pp      mov    {papera,      {boot
boot    spl    *papera+CORESIZE/2+6, {22700
papera  spl    @0+6,         >pstepa
        mov    }papera,      >papera
        mov    {papera,      <paperb
paperb  spl    @0,           >pstepb
        mov.i  #off,         }CORESIZE/2-1-off

        end
