# Decoy Maker

A **decoy maker** rapidly builds a decoy of incremented / decremented locations to distract [scanners](scan.htm) and [quickscans](quickscan.htm). Decoy makers are typically used as the opening strategy for large scanners / bombers.

```redcode
; build a 16 cell decoy in 6 cycles 

        dpos   equ decoy+4000

decoy   nop    >dpos,    }dpos+1
        mov    {dpos+2,  <dpos+4
        mov    {dpos+5,  <dpos+7
        mov    {dpos+8,  <dpos+10
        mov    {dpos+11, <dpos+13
        djn.f  wgo,      {dpos+15
```

Source: [corewar.co.uk/decoymaker.htm](https://corewar.co.uk/decoymaker.htm)
