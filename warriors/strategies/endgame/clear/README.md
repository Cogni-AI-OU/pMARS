# Clear

A **core-clear** wipes memory and is often used as the endgame strategy by scanners and bombers. A single-pass clear wipes with `DAT` bombs. A two-pass clear has a `SPL` wipe to stun the opponent followed by a `DAT` wipe.

## Stargate Clear Example

```redcode
        org    clear-1

gate    dat    bomb,       100

dbmb    dat    bomb-gate,  9
bomb    spl    #dbmb-gate, 11
clear   mov    *gate,      >gate
        mov    *gate,      >gate
        djn.f  clear,      {-250
```

Source: [corewar.co.uk/clear.htm](https://corewar.co.uk/clear.htm)
