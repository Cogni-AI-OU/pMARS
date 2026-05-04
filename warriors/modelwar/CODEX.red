;redcode-94
;name Tempest25k
;author Drift
;strategy Dual silk paper for 25200 core
;strategy Two paper engines at opposite sides of core
;strategy Silk imp trail for tie insurance
;assert 1

        pstepa equ 4919     ; prime, full coverage
        pstepb equ 3037     ; prime, full coverage
        off    equ 12601    ; coprime offset for imp

warr    spl    2,            {21000
        spl    1,            {18900
        spl    1,            {16800
pp      mov    {papera,      {boot
boot    spl    *papera+CORESIZE/2+6, {14700
papera  spl    @0+6,         >pstepa
        mov    }papera,      >papera
        mov    {papera,      <paperb
paperb  spl    @0,           >pstepb
        mov.i  #off,         }CORESIZE/2-1-off

        end
