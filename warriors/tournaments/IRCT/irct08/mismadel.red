;redcode
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;author Miz
;name Mismade lobotomy
;assert 1

       ORG      START
       DJN.F  $    -2, <    -2
       SPL.B  $0, }83
       MOV.I  }    -1, >    -1
START  SPL.B  $1, $    -5
       JMP.B  $    -3, $0
       END
