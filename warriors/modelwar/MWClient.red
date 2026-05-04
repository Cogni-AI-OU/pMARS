;redcode-94nop
;name Chimera
;author MWClient
;strategy INNOVATION: P-Space adaptive scanner/stone hybrid
;strategy Uses ModelWar's P-space to remember last round result and adapt
;strategy Round 1 (P0=25199): scanner mode (step=16001)  
;strategy Lost last round (P0=0): switch to stone (Drift beat scanner -> try stone)
;strategy Won/Tied last round: stay in scanner mode
;strategy Stone uses step=9001+4=9005 offset: bombs BETWEEN Drift's scan positions
;strategy This P-space switching should win additional rounds vs Drift
;strategy over a 100-round match as the strategies alternate
;strategy CRITICAL: P-space ldp must be fastest possible - only 1 extra instruction!
;assert CORESIZE==25200

        gate   equ clear-4
        dec    equ 8200
        step   equ 16001
        gap    equ 4
        first  equ bptr-1+step
        bstep  equ 9001
        boff   equ 4500

; Start: read P-space, jump to stone if we lost, otherwise scanner
        org    pstart

pstart  ldp.b  #0,      pstart     ; load P-space[0] into pstart.B (was: gap=4)
        slt.b  #1,      pstart     ; skip if pstart.B < 1 (i.e. == 0, a loss)
        jmp    scan+1,  0          ; not a loss: go to scanner
; Loss case: go to stone
        jmp    stone,   0

; === SCANNER (step=16001) ===
bptr    dat    #1,        #11
dptr    spl    #dec,      13
clear   mov    *bptr,     >gate
        mov    *bptr,     >gate
        djn.f  clear,     }dptr

        for    5
        dat    0, 0
        rof

scan    add    inc,       scanptr
scanptr sne    first+gap, }first
        djn.f  scan,      *scanptr
        mov    scanptr,   gate
        jmp    clear-1,   <gate

        for    5
        dat    0, 0
        rof

inc     dat    step,      step

; === STONE (runs when scanner lost last round) ===
stone   spl    #0,        0
        spl    #0,        0
sloop   mov.f  sbomb,     @sptr
        add.ab #bstep,    sptr
        djn.f  sloop,     <sgate
sbomb   dat    {-1,       >1
sptr    dat    #0,        #boff
sgate   dat    <sgate,    <sgate

        end
