;redcode
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;name paw-print
;author simon wainwright
;assert 1

       ORG      START
       SPL.B  {0, }0
       SPL.B  {0, }0
       MOV.I  $    -3, <    -3
START  SPL.B  {0, }0
       SPL.B  {0, }0
       END
