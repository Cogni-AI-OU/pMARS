;  Killer 2     by ThM
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;
           JMP   Start
Ptr1       Dat   #0, #111
Ptr2       Dat   #0, #11
Ptr3       Dat   #0, #5
Start      Mov   #-250,    Ptr1
           Mov   #11,      Ptr2
           Mov   #8,       Ptr3
           Mov   <Ptr3,    <Ptr1
           Djn   -1,       Ptr2
           Spl   #-269
           Mov   0,        1
           End   Start
