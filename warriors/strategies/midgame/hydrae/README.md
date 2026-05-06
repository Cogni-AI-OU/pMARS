# Hydra

A **hydra** launches multiple copies of tiny bombers / clears.

## Continuous Hydra Example

```redcode
        first  equ 500
        step   equ 889

tspl    spl    #4000,    <boot
        mov.i  #1,       <boot
boot    mov    tdjn,     first
        add    #step,    boot
        mov    tspl,     @boot
        djn.f  @boot,    <-100
tdjn    djn    -2,       #3352
```

Source: [corewar.co.uk/hydrae.htm](https://corewar.co.uk/hydrae.htm)
