       ORG          1
       DAT.F  $     1, $     1     
       SPL.B  $     5, >    -5     
       SPL.B  $     1, >    -4     
       SPL.B  @     0, >    -4     
       MOV.I  {    -1, <    -1     
       DAT.F  <    -2, <     2     
       MOV.I  $    -1, >     3     
       DJN.F  $    -1, >     2     
       JMP.B  $    -1, >     4     
       DAT.F  >     5, >     1     
       END
