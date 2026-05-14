;redcode
;name Inconvenience
;author Jens Gutzeit
;strategy I've used only stolen Redcode in this warrior.
;assert (CORESIZE==7919) && (MAXPROCESSES==50)
;assert (MAXCYCLES==79000) && (MAXLENGTH==100)
;assert (MINDISTANCE==100)

       ORG     qGo

;;
;; boot
;;

       pAway   EQU     2727

boot    mov.i   to,             pAway
pCopy   mov.i   { boot,         < boot
       mov.i   { boot,         < boot
       djn     pCopy,          # 3
       jmp     @ boot

;;
;; paper (Digital Rain by inversed)
;;


       l       EQU     25
       zofs    EQU     1971
       bo1     EQU     2638
       bo2     EQU     2649
       color   EQU     4001

from    mov     #l,     #0
loop    mov     {bo1,   {bo2
       add     {0,     }0
       mov     <from,  {to
       jmn     loop,   from
       spl     >from,  }color
to      jmz     zofs,   *0

;;
;; quickscanner (q^3)
;;

       start   EQU     boot    ; first instruction of this warrior
       qStep   EQU     5400    ; distance between two scans
       qHop    EQU     1300    ; scan distance within a scan

for 21
       dat.f   0,              0
rof

;; decoding table

       dat.f   15,             10      ; A, D
qTab    dat.f    7,              4      ; B, E
       dat.f   13,             11      ; C, F

qGo     seq     found+1*qStep,          found+1*qStep+qHop  ; 1
       jmp     qSelect

       seq     found+3*qStep,          found+3*qStep+qHop  ; E-1
       jmp     > attack1,              < qTab

       seq     found+4*qStep,          found+4*qStep+qHop  ; E
       jmp     > attack1

       seq     found+5*qStep,          found+5*qStep+qHop  ; E+1
       jmp     > attack1,              > qTab

       seq     found+6*qStep,          found+6*qStep+qHop  ; B-1
       jmp     attack1,                { qTab

       seq     found+7*qStep,          found+7*qStep+qHop  ; B
       jmp     attack1

       seq     found+8*qStep,          found+8*qStep+qHop  ; B+1
       jmp     attack1,                } qTab

       seq     found+9*qStep,          found+9*qStep+qHop  ; D-1
       djn.b   > attack1,              { attack2

       seq     found+10*qStep,         found+10*qStep+qHop ; D
       jmp     > attack1,              { attack2

       seq     found+11*qStep,         found+11*qStep+qHop ; F
       jmp     > attack1,              } attack2

       seq     found+13*qStep,         found+13*qStep+qHop ; C
       jmp     attack1,                } attack1

       seq     found+14*qStep,         found+14*qStep+qHop ; A-1
       djn.a   attack1,                { attack1

       seq     found+15*qStep,         found+15*qStep+qHop ; A
       jmp     attack1,                { attack1

       seq     found+18*qStep,         found+18*qStep+qHop ; B*E+1-B-E
       djn.f   attack2,                qTab

       seq     found+21*qStep,         found+21*qStep+qHop ; B*E-B
       jmp     attack2,                < qTab

       seq     found+24*qStep,         found+24*qStep+qHop ; B*E-E
       jmp     attack2,                { qTab

       seq     found+32*qStep,         found+32*qStep+qHop ; B*E+E
       jmp     attack2,                } qTab

       seq     found+35*qStep,         found+35*qStep+qHop ; B*E+B
       jmp     attack2,                > qTab

       seq     found+39*qStep,         found+39*qStep+qHop ; C*E-C
       djn.b   attack2,                } attack1

       seq     found+52*qStep,         found+52*qStep+qHop ; C*E
       jmp     attack2,                } attack1

       seq     found+56*qStep,         found+56*qStep+qHop ; A*E-E
       djn.a   attack2,                { attack1

       seq     found+60*qStep,         found+60*qStep+qHop ; A*E
       jmp     attack2,                { attack1

       seq     found+63*qStep,         found+63*qStep+qHop ; B*D-B
       djn.b   attack2,                { attack2

       seq     found+66*qStep,         found+66*qStep+qHop ; B*F-F
       djn.a   attack2,                } attack2

       seq     found+70*qStep,         found+70*qStep+qHop ; B*D
       jmp     attack2,                { attack2

       seq     found+77*qStep,         found+77*qStep+qHop ; B*F
       jmp     attack2,                } attack2

       sne     found+28*qStep,         found+28*qStep+qHop ; B*E
       jmz     boot,                   found+28*qStep+qHop-10

;; decoder

attack2 mul.b   qTab,           found
attack1 mul.ab  qTab,           @ attack2

;; choose between the two possible positions

qSelect sne.i   (start - 1),    @ found ; use 1st position?
       add.ab  # qHop,         found   ; no, use 2nd!

;; bombing engine V

       qTimes  EQU     20         ; number of bombs to throw
       qStep2  EQU     4          ; distance between bombs
       qDist   EQU     (qTimes*qStep2 - 10)

qLoop   mov     qBomb,          @ found
found   mov     qBomb,          * qStep
       sub     # qStep2,       found
       djn     qLoop,          # qTimes

       jmp     boot            ; start paper
qBomb   dat.f   { qDist,        { 1
       end
