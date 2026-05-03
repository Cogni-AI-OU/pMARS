# Clear/Imp

A **clear/imp** combines an imp spiral with a core-clear to create a warrior which performs well against stone/imps.

## D-Clear with JMP/ADD Launch Example

```redcode
        org    start

gate    dat    4000,       1700
bomb    dat    >2667,      11

        for    4
        dat    0,0
        rof

        spl    #4000,      >gate
clear   mov    bomb,       >gate
        djn.f  clear,      >gate

        for    23
        dat    0,0
        rof

        istep  equ 1143           ; (CORESIZE+1)/7

start   spl    clear-1
        mov    imp,        *launch
        spl    1                  ; 32 parallel processes
        spl    1
        spl    1
        spl    1
        spl    1
        spl    nxpoint
launch  djn.f  3600,       <4000

        for    2
        dat    0,0
        rof

nxpoint add.f  #istep,     launch
        djn.f  clear-1,    <3000

imp     mov.i  #1,         istep
```

Source: [corewar.co.uk/clearimp.htm](https://corewar.co.uk/clearimp.htm)
