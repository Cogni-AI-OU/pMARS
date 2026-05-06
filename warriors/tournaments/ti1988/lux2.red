; Lux 2
; Luca Crosara
;
; Modernized for ICWS'88 compatibility: added mandatory commas, explicit
; B-fields, and immediate operand restrictions for DAT, CMP, and JMN.
;
;assert CORESIZE==8192
        dat     #1, #0
;          (...)
        dat     #1
jj      jmp     -1, 0
ss      spl     0, 0
start   add     jjb, count1
        jmz     sss, @count
        cmp     #47, count
count   jmn     jjj, #-2169
jjb     jmn     bbb, #12
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
jjj     mov     jj, @count
        mov     ss, <count
        add     #1, count
sss     sub     jjb, count
        jmz     start, @count1
j       mov     jj, @count1
        mov     ss, <count1
        add     #1, count1
count1  jmn     start, #2064
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
bbb     mov     #-51, count
        mov     #45, count1
        mov     jjbb, jjb
        jmp     start, 0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
        dat     #0, #0
jjbb    jmn     40, #6
hhjj    mov     bomb, @bomb
        djn     hhjj, bomb
bomb    dat     #-23, #0
        dat     #1, #0
;          (...)
        dat     #1, #0

        end     start
