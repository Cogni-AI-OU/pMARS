# Imps

An **imp** is a mobile program which copies itself just ahead of its own instruction pointer. Modern imps often run multiple processes in a ring or spiral pattern and are usually paired with [paper](paper.htm) or [stone](stone.htm).

## Imp Ring Example

```redcode
        istep  equ 2667           ; (CORESIZE+1)/3

launch  spl    istep+1
        mov    launch,     launch+istep+1
imp     mov.i  #0,         istep
```

Source: [corewar.co.uk/imp.htm](https://corewar.co.uk/imp.htm)
