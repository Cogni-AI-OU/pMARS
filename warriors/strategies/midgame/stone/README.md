# Stone

A **stone** blindly scatters simple bombs through memory in the hope of hitting an opponent. Modern stones are normally small, fast, score well against [scanners](scan.htm) and lose to [paper](paper.htm).

## Transposition Stone Example

```redcode
        step   equ 1185           ; mod 5

inc     spl    #-step,   <step
stone   mov    >step,    1-step
        sub    inc,      stone
        djn.f  stone,    <5555
```

Source: [corewar.co.uk/stone.htm](https://corewar.co.uk/stone.htm)
