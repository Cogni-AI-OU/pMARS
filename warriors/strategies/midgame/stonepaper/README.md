# Stone -> Paper

A **stone -> paper** uses a small stone to eliminate scanners, then switches to a paper to hopefully beat stones and tie other papers.

```redcode
        sstep  equ 7585
        bdist  equ (pboot+8+sstep)

sboot   mov    stone+3,   bdist   ; boot stone
        mov    stone+2,   <sboot
        mov    stone+1,   <sboot
        mov    stone,     <sboot
        jmp    @sboot

stone   mov    {4000,     sstep-1
        add    inc,       stone
inc     jmz.f  stone,     <sstep
        jmp    pboot-bdist        ; jump back to paper

        pstep  equ 1480
        istep  equ 1143           ; (CORESIZE+1)/7

pboot   spl    1                  ; 8 parallel processes
        spl    1
        spl    1

paper   spl    @0,         {pstep
        mov    }paper,     >paper
        spl    0                  ; vortex launcher
        add.a  #istep,     launch
launch  djn.f  imp-istep*8,{600

imp     mov.i  #1,         istep
```

Source: [corewar.co.uk/stonepaper.htm](https://corewar.co.uk/stonepaper.htm)
