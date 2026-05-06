# Bootstrap

**Bootstrapping**, or booting away, is where the main body of a program is moved from its initial location. This is used to leave behind a decoy to distract scanners, or to space out multiple components in the core.

## Unrolled Loop Boot

The simplest boot method is an unrolled loop, which uses one `MOV` instruction for each instruction to be copied.

```redcode
; boot code

        bdist  equ 1000

        mov    <ssrc,    {sdest
        mov    <ssrc,    {sdest
        mov    <ssrc,    {sdest
        mov    <ssrc,    {sdest

sdest   jmp    bdist+4            ; destination pointer
ssrc    dat    inc+4              ; source pointer

; stone to be booted away

        step   equ 1185

inc     spl    #-step,   <step
stone   mov    >step,    1-step
        sub    inc,      stone
        djn.f  stone,    <5555
```

Source: [corewar.co.uk/boot.htm](https://corewar.co.uk/boot.htm)
