;redcode-MC6
;name pIdee
;author Christian Schmidt
;assert 1

;pmars -r 5000 -l 100 -d 200 entry1.red entry2.red
;Components for MC#6:

gate: jmp #0,<-3

for 5
dat 0, 0
rof

imp: mov.i #4,1

for 5
dat 0, 0
rof


ptr equ clear-3
clear: mov bmb,}ptr ;<-- must start here
mov bmb,}ptr
jmp -2
bmb: dat 7,0

for 5
dat 0, 0
rof

;Action needed----------------------------------------

; imp   vs.  imp    -> tie
;                         \-> next gate
; imp   vs.  gate   -> lose
;                         \-> next clear
; imp   vs.  clear  -> win
;                         \-> next imp
; gate  vs.  gate   -> tie
;                         \-> next clear
; gate  vs.  clear  -> lose
;                         \-> next imp
; gate  vs.  imp    -> win
;                         \-> next gate
; clear vs.  clear  -> 50/50 win lose  ;the tricky part
;                         \-> next imp
; clear vs.  imp    -> lose
;                         \-> next gate
; clear vs.  gate   -> win
;                         \-> next clear

;switching table--------------------------------------

;Strat L     W     T
;imp   clear imp   gate
;gate  imp   gate  clear
;clear imp   clear clear

;S  L W T
;00 2 0 1
;01 0 1 2  
;02 0 2 2


;switching to counter strategy
;imp -> clear
;gate -> imp
;clear -> gate

;but first detection of consecutive wins for each strategy
;before switching to counter strategy

w0   equ imp
w1   equ gate
w2   equ clear

strat equ 3

;***** p-switcher ******

think  ldp.ab #0,     #0         ;last round result
       sne    #-1,    think      ;if first round
       jmp    init               ;initialize
       ldp.a  #strat, sTable     ;load last strategy
sTable jmp    @0,    w0Go
       dat    #0,    w1Go
       dat    #0,    w2Go

;processing strategy w0---------------------------------

init   add.ab #3,    think
w0Go   sne    #2,    think
       jmp    w0
       sne    #0,    think
       jmp    w2Sw
w1Sw   stp.ab #1,    #strat
       jmp    w1  

;processing strategy w1---------------------------------

w1Go   sne    #2,    think
       jmp    w1
       sne    #0,    think
       jmp    w0Sw
w2Sw   stp.ab #2,    #strat
       jmp    w2  

;processing strategy w2---------------------------------

w2Go   sne    #2,    think
       jmp    w2
w0Sw   stp.ab #0,    #strat
       jmp    w0   

end think
