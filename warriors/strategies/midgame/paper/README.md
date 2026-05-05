# Paper

A **paper** is a self-replicating program which spawns off multiple copies of itself and executes them in parallel. Modern papers are normally small, resilient, score well against [stones](stone.htm) and lose to [scanners](scan.htm).

## Silk Paper Example

```redcode
        step1  equ 4832
        step2  equ 3416
        step3  equ 3600

        spl    2                  ; 6 parallel processes
        spl    1
        spl    1

papera  spl    @papera,  >step1
        mov    }papera,  >papera
paperb  spl    @paperb,  >step2
        mov    }paperb,  >paperb
        mov    {paperb,  <paperc
paperc  djn.f  @paperc,  >step3
```

Source: [corewar.co.uk/paper.htm](https://corewar.co.uk/paper.htm)
