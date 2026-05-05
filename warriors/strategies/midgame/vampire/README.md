# Vampire

A **vampire** (or pit-trapper) attempts to capture enemy processes by placing a fang (`JMP` instruction) inside the opponent's code. The fang points to a trap routine which splits off useless processes to slow the opponent.

## Scanning/Bombing Vampire Example

```redcode
        step   equ 6192           ; mod 16

vampire add    inc,       fang
        mov    fang,      @fang
        jmz.f  vampire,   *fang
        mov    fang,      *fang
        mov.a  #0,        *fang
        jmz.f  vampire,   trap
        jmp    clear-1

fang    jmp    @step,     trap-step
inc     dat    step,      -step

        for    8
        dat    0,0
        rof

        gate   equ clear-4
        dec    equ 1500

bptr    dat    1,         11
dptr    spl    #dec,      13
clear   mov    *bptr,     >gate
        mov    *bptr,     >gate
        djn.f  clear,     }dptr

        for    73
        dat    0,0
        rof

trap    spl    #0,        {0
        spl    {0,        }0
        jmn.a  trap+1,    trap
```

Source: [corewar.co.uk/vampire.htm](https://corewar.co.uk/vampire.htm)
