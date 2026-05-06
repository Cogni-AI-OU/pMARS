# Handshake

**Handshaking** is an opening strategy where a warrior detects when it's fighting itself and causes one copy to suicide. This leaves the other copy with 100% wins and artificially inflates its score.

## Dedicated Handshake Example

```redcode
        org    hshake

        hkey1  equ 197
        hkey2  equ 381

;       dat    ?,        0

hshake  ldp    #0,       #0
        jmn    wgo,      @hshake
        jmz    hlost,    hshake
hseek   seq.i  hptr,     {hptr
        jmz    hseek,    hptr
hptr    stp    #-100,    #0
        mov.x  hlost,    *hptr
hlost   ldp    #hkey2,   #hkey1+1
        seq    #hkey1,   hlost
        jmp    wgo

;       dat    ?,        ?
```

Source: [corewar.co.uk/handshake.htm](https://corewar.co.uk/handshake.htm)
