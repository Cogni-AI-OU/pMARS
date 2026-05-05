;
;    Warrior: Vlad
;  File name: vlad.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: D.Bofinger & T.J.Allen, 7/90
;
;             Inspired by Robert Martin's Vampire
;
; Vlad (the Impaler) -- spray the world with lures, when
;  someone is trapped breed him up as a slave
;  to help you erase the world. Keep erasing
;  the world until the enemy is extinct in
;  the wild, then have the slaves commit
;  suicide.
; Note: The register gotme should contain the process limit, but the program
;  should still run if it's wrong (at greatly reduced efficiency).
;
;
;trap sector
;
twirl    djn    stab, gotme
seppuku  mov    ammo, breed
        mov    ammo, stab
gotme    dat    <64, <64
stab     mov    bomb, <molar
        jmp    stab, 0
spin     mov    go, start
        djn    breed, gotme
        jmp    seppuku, 0
breed    spl    twirl, 0
        jmp    breed, 0
;
;start of real program
;
start    mov    fang, @tusk
        add    #37, tusk
        sub    #37, fang
        djn    start, ammo
worry    mov    #209, ammo
        add    #7722, fang
        sub    #7722, tusk
        jmp    start, 0
erase    mov    bomb, <molar    ;start doing our bit in the erasure

        jmp    erase, 0
go       jmp    erase-start, 0
fang     jmp    @0, (spin-tusk-2500)
ammo     dat    <0, <145
tusk     dat    <0, <2500
bomb     dat    <twirl-molar, <twirl-molar
molar    dat    <twirl-molar, <twirl-molar
        end start
