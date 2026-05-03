# Paper/Imp

A **paper/imp** launches imps rings from a paper to create a defensive warrior which can be difficult to beat. They tend to tie against most opponents but only claim a small number of wins.

## Paper with Embedded Launch Example

```redcode
        step1  equ 4072
        step2  equ 3144
        istep  equ 2667           ; (CORESIZE+1)/3

        spl    1                  ; 8 parallel processes
        spl    1
        spl    1

papera  spl    @0,         {step1
        mov    }papera,    >papera
paperb  spl    step2,      {papera
        mov    }papera,    }paperb

        spl    0                  ; launcher
        spl    imp+istep
        spl    imp+istep*2
imp     mov.i  #1,         istep
```

Source: [corewar.co.uk/paperimp.htm](https://corewar.co.uk/paperimp.htm)
