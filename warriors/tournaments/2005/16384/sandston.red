;redcode
;name Sandstone
;author S.Fernandes
;strategy stone/clear/imp
;assert CORESIZE == 16384

; Roy seems to instinctively place numerous processes into a
; variety of components scattered through core, with deadly
; efficiency. Roy shouldn't have any problems adapting to
; this round's restrictions and will probably come up with a
; stone/clear/imp.

; I've never written a multi-component warrior before. I'm
; going to have to learn quickly to stand a chance against
; Roy. I'll try a stone/clear/imp.

; processes - 13 stone, 11 clear, 8 imp

        org     pgo

cdist   equ     4096
idist   equ     -3000
istep   equ     3277
sstep   equ     10372
gate    equ     (clear-5)
cloc    equ     (stone+cdist)
gloc    equ     (cloc+gate-clear)
iloc    equ     (stone+idist)

pgo     spl     1
        spl     1
        spl     1
        spl     1
        spl     1
        mov.i   #0          ,    {0
        jmp     @vector     ,    }0

clear   mov     cbomb       ,    >gate
        djn.f   clear       ,    >gate
        jmp     clear       ,    >gate
cbomb   dat     <10923      ,    <5462

imp     mov.i   #1          ,    istep

vector  dat     cboot
        dat     cboot
        dat     cboot
        dat     cboot
        dat     gboot
        dat     iboot

cvector dat     cloc
        dat     cloc+1
        dat     cloc
        dat     cloc+1
        dat     cloc

ivector dat     iloc
        dat     iloc+istep*1
        dat     iloc+istep*2
        dat     iloc+istep*3
        dat     iloc+istep*4
        dat     iloc+istep*5
        dat     iloc+istep*6
        dat     iloc+istep*7

svector dat     stone
        dat     stone+1
        dat     stone+2
        dat     stone+3
        dat     stone+1
        dat     stone+2
        dat     stone+3
        dat     stone+1
        dat     stone+2
        dat     stone+3
        dat     stone+1
        dat     stone+2
        dat     stone+3

cptr    dat     cbomb+1     ,    cloc+4
cboot   mov     {cptr       ,    <cptr
        jmp     @cvector    ,    }0
gboot   mov     #15         ,    gloc
        jmp     cloc        ,    <1111
iboot   mov     imp         ,    iloc
        jmp     cloc+1      ,    <2222

        for     144
        dat     0           ,    0
        rof

stone   mov     {-sstep     ,    {sstep
sloop   mov     <-sstep*2   ,    2+sstep*2
        add     stone       ,    sloop
        djn.f   sloop       ,    {-555
        jmp     sloop+1     ,    {-556
