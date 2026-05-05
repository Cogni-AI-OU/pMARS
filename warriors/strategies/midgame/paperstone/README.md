# Paper/Stone

A **paper/stone** usually pairs an aggressive paper with a stone to improve the performance against other papers and stone/imps.

```redcode
        spos   equ sboot+1001
        ppos   equ spos+2196

warr    spl    1                   ; 4 parallel processes
        spl    1

        mov    {papera,  {sboot
sboot   spl    spos
        spl    *sboot
        mov    {papera,  {pboot
pboot   djn.f  ppos,     <4000

        step1  equ 2552
        step2  equ 3180

papera  spl    @papera+8,>step1
        mov    }papera,  >papera
        mov    {papera,  <paperb
paperb  djn.f  @paperb,  >step2

        step   equ 6188

inc     spl    #-step,   }step
stone   mov    >step,    1-step
        sub    inc,      stone
        djn.f  stone,    <-200
```

Source: [corewar.co.uk/paperstone.htm](https://corewar.co.uk/paperstone.htm)
