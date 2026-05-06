;redcode-94
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;name Self-Modifying Code
;author Ben Ford
;assert (CORESIZE==8000)
;strategy p^3++: silk, rock, scan, burn, wipe
;strategy heavily based on Recycled Bits by David Moore
;strategy improved the brain with ideas from the P^3 switcher
;strategy saved 15 instructions and 1 cycle in brains + tables
;strategy v0.11 more constants tweaked and more instructions shaved
;strategy and anti-combatra measure added

; Note: This is a reconstructed version based on David Moore's 'Recycled Bits'
; and the description in KOFACOTO Round 5 results. The original source for 
; 'Self-Modifying Code' v0.11 was not available, so it was adapted using 
; the P^3 brain logic from Leonardo Liporati's 'Stolen RedCode'.

; ----- p^3++ table -----
; Reconstructed using David Moore's P^3 switcher logic

vect    spl     #w0,  #1045   ; 0  silk
        spl     #w1,  #508   ; 1  rock
        spl     #w2,  #511   ; 2  scan
        spl     #w3,  #624   ; 3  burn
        spl     #w4,  #894   ; 4  wipe
        ; ... other states could be added if transitions were known
        
pmod    spl     #0,  #12   ; lose
        spl     #0,  #11   ; win
        spl     #0,  #13   ; tie

boot    equ     1430
spacing equ     2
w0      equ     (silk-silk)
w1      equ     (rock-silk)
w2      equ     (scan-silk)
w3      equ     (burn-silk)
w4      equ     (wipe-silk)

for     spacing
        dat     $0,  $0
rof

; ----- silk (from Recycled Bits) -----
p1 equ 2333 
p2 equ 1737 

silk    spl 2, >7398
        spl 1, >5483
        spl 1, >6723
        spl  @0, >p1
        mov }-1, >-1
        mov {-2, <1
        spl  @0, >p2
        mov.i #2*p1, }-p1
        dat 1,1

for     spacing
        dat     $0,  $0
rof

; ----- rock (from Recycled Bits skew dwarf) -----
dstep equ 81
dhop  equ 5277
dtime equ 1677

rock    spl  #0, <dhop+2
rptr    mov datb, {(dstep*dtime)+1
        mov datb, @-1
        sub #dstep, -2
        djn.f -3, <dhop-2
datb    dat <dhop+1, >1

for     spacing
        dat     $0,  $0
rof

; ----- scan (from Recycled Bits) -----
step equ 5379

scan    nop 0, 5000
sm      mov sb, >scan
sc      add #step+1, #step+1
        jmz.f sm, <sc
        slt.b sc, #14
        mov.b sc, scan
        jmn sm, sc
        jmp sm, }sm
sb      spl #0, {0

for     spacing
        dat     $0,  $0
rof

; ----- burn (from Recycled Bits incendiary) -----
bstep equ 2394
bhop  equ 7953
btime equ 1378
bgate equ    3

burn    spl    #1,bhop
        add   #bstep, 1
        mov     bmov, >2-bstep*btime
        mov     burn, @-1
        jmz       -3, #0
        mov  bdat,>burn-bgate
        djn.f  -1,>burn-bgate
bdat    dat <2667, 2+bgate-burn
bmov    mov -bhop,>-bhop

for     spacing
        dat     $0,  $0
rof

; ----- wipe (from Recycled Bits sdd clear) -----
wtop equ (wipe-3)

wipe  spl   #-1,  wend-wtop
      mov *wend, >wtop
      mov *wend, >wtop
      djn.f  -1, {wtop
      jmp    -2, <wtop-2667
      dat    #0,  wend-wtop-1
      dat <5334, <2667
      spl   #-2,  wend-wtop
wend  spl #wipe,  wend-wtop

for     spacing
        dat     $0,  $0
rof

; ----- p^3++ brain -----
PKEY    equ     321
SIZE    equ     10

main    ldp.a   #0,   pmod
        ldp.a   #PKEY,   vect
        mod.ba  *pmod,   vect
        stp.b   *vect,  #PKEY
        mov.i   #0   ,  -1
        add.ab  *vect,   last
for     SIZE
        mov     <last,  {last
rof
last    djn.f    *boot, #silk+SIZE

end main
