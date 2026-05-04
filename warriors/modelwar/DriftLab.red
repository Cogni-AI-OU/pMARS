;redcode-94nop
;name Avalanche25k
;author Drift
;strategy Massive DAT-padded stone for 25200 core
;strategy 4800 DAT padding (invisible to sne.x scanners)
;strategy Stone step 3037 (prime, full 25200 coverage)
;strategy Silk imp at step 2291 for tie insurance
;assert 1

        ; 2400 DAT front padding (invisible to scanner)
        for 2400
        dat    0, 0
        rof

        org    go

        sstep  equ 3037
        istep  equ 2291
        time   equ 1500

go      spl    #0,         6
st_mov  mov    st_bomb,    @st_ptr
st_hit  sub.x  #sstep*2,   @st_mov
st_ptr  mov    {-4447,     }(st_hit+st_ptr+sstep*time)
        djn.f  @st_hit,    }st_ptr
st_bomb dat    <sstep,     >1

        spl    1,          0
        spl    1,          0
imp     mov.i  #istep,     istep

        ; 2400 DAT back padding
        for 2400
        dat    0, 0
        rof

        end
