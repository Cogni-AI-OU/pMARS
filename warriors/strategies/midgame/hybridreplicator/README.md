# Hybrid Replicator

A **hybrid replicator** is a self-replicating program, which also bombs or scans while spawning off new copies of itself.

## Replicator/Bomber Example

```redcode
        step   equ -203
        length equ 24

paper   mov    #length,    #9
copy    mov    <paper,     <dest
bptr    mov    <-664,      -1299
        add    <0,         >0
        mov    bomb,       }bptr
        jmn    copy,       paper
        spl    >paper,     >4000
dest    jmz    @0,         step
bomb    dat    }1,         >1
```

Source: [corewar.co.uk/hybridreplicator.htm](https://corewar.co.uk/hybridreplicator.htm)
