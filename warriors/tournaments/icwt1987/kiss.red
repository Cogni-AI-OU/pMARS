;redcode
;name Kiss
;author Laszlo Kiss
;strategy ICWS'87 finalist
;strategy a.k.a. Ultima Ratio Regum
;assert 1
START   MOV     A      ,<ADDR
        MOV     B      ,<ADDR
        JMN     $-2    ,ADDR
S1      MOV     #-16   ,ADDR
        MOV     C      ,<ADDR
        JMN     $-1    ,ADDR
        MOV     #-16   ,ADDR
        JMP     START
A       JMP     $-1
B       SPL     0
C       DAT             #0
ADDR    DAT             #-16
        END
