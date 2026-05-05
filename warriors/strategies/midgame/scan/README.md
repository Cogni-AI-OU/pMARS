# Scanner / Scissors

A **scanner** searches for the opponent and hits hard, first stunning with a `SPL` attack then switching to a deadly `DAT` attack. Modern scanners are often large and fragile, scoring well against [paper](paper.htm) but losing to [stones](stone.htm).

## Blur Scanner Example

```redcode
        step   equ 4884

wptr    mov.b  scan,       #0
scan    add    #step,      #step
gate    mov    *bomb,      >wptr
        jmz.f  scan,       @scan
        jmn    wptr,       *wptr

bomb    spl    0,          0
clear   mov    dbmb,       >gate
        djn.f  clear,      >gate
dbmb    dat    <2667,      2-gate
```

Source: [corewar.co.uk/scan.htm](https://corewar.co.uk/scan.htm)
