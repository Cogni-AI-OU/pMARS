;redcode 
;name Backup 
;author Fluffy 
;strategy quickbombing -> imp + clear/gate 
;assert CORESIZE == 8192 
 
 ORG wGo 
 
wGo spl 1, 0 
 spl 1, 0 
 spl 1, 0 
 spl 1, 0 
 spl 1, 0 
 spl 1, 0 
 spl 1, 0 
 spl 1, 0 
 spl 1, 0 
 mov.i #0, {0 
 
;; 
;; quickbombing + reducing the number of processes 
;; 
 
 mod.x #6765, #4181 
 mov.i cBomb, <wGo + 1 
 
i for 30 
 mov.i cBomb, <7700 - (i - 1) *250 
rof 
 
 ; reduce number of processes to 2 
 
 mod.x #3, #2 
 
 mov.i cBomb, <wGo + 1 
 
 ; start backup imp and clear 
 
 djn imp, #1 
 jmp clear, <4000 
 
for 146 
 dat.f 0, 0 
rof 
 
;; 
;; clear 
;; 
 
clear mov.i cBomb, <cPtr 
 jmp clear, < -10 
 
 
cBomb dat.f 0, -5 
cPtr dat.f 0, -500 
 
for 103 
 dat.f 0, 0 
rof 
 
;; 
;; backup imp 
;; 
 
imp mov.i #1, 1 
 
 END
