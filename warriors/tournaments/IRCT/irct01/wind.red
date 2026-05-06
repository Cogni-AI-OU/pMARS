;redcode
; Fixed syntax for pMARS compatibility: removed colons from labels, standardized spaces, and/or fixed EQU/label conflicts.
;name   Wind
;author Philip Thorne
;assert CORESIZE==80
;assert MAXLENGTH==5
SPL.B  #0, $0
MOV.I  $3, @2     
ADD.AB #36, $1     
DJN.F  $    -2, {   -24     
DAT.F  $2, >1     
