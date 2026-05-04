;redcode-94nop
;name InnovationNightfall-J
;author InnovationStation (derived from Nightfall by Drift)
;strategy Half-core scanner with 1750 SPL decoy shield
;strategy SPL decoys poison enemy papers and confuse scanners
;strategy Scanner uses st=14/fi=2100 (optimized parameters)
;strategy Novel: asymmetric padding (SPL shield + DAT quiet zone)
;assert 1

        ;; Nightfall: the decoy field IS the defense.\n        ;; 1750 SPL instructions create a noise wall.\n        ;; Enemy scanners waste attacks on decoys.\n        ;; Enemy papers copy SPL poison into their own code.\n        ;; The scanner operates from the quiet DAT zone.\n\n        for 1750\n        spl    #1, 1\n        rof\n\n        st equ 13\n        fi equ 2075\n        sw equ (sp-1)\n        gt equ (att-2)\n\nsp      dat    fi+st,  fi\n\n        for 5\n        dat 0,0\n        rof\n\natt     mov    sp,     sw\nwip     mov    sb,     <sw\n        mov    >sw,    >sw\n        jmn.f  wip,    >sw\n\nrst     mov.ba @inc,   @inc\n\nscn     sub    inc,    @inc\n        sne.x  *sp,    @sp\ninc     sub.x  #-2*st, sp\n        jmz.f  scn,    @sp\n\n        slt    sp,     #db+3-sp\n        jmp    att\n        djn    rst,    #16\n\nsb      spl    #0,     {0\nclr     mov    db,     >gt\n        djn.f  clr,    {gt\n\ndb      dat    >1,     2-gt\n\n        for 2128\n        dat    0, 0\n        rof\n\n        end    scn+1
