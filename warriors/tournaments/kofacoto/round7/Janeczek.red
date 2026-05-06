;redcode
;name ]enigma[
;author Michal Janeczek
;strategy Paper with imps
;strategy Modified to match KOFACOTO Round 7 results (eStep=1751, -p 256)
;assert 1
eStep equ 1751
eImp equ 1143
eLength equ 8
spl 1 , 0
eDst spl 1 , ePaper+eLength+eStep
eSrc spl 1 , ePaper+eLength
mov <eSrc , <eDst ; fixed from << to < for '88 compatibility
ePaper spl eStep , eLength+(eStep*2)
mov <ePaper+eLength+eStep , <ePaper ; fixed from << to < for '88 compatibility
mov <eLength , <1 ; fixed from << to < for '88 compatibility
spl @0 , 2365
spl 0 , 0
add #eImp , 1
jmp @0 , -eImp
mov 0 , eImp
