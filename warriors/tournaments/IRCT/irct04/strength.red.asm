       ORG          5
       DAT.F  $     0, $   -10     
       SPL.B  #     0, {    -1     
       MOV.I  @     0, >    -2     
       MOV.I  @     0, >    -3     
       JMP.B  $    -1, {    -4     
       SPL.B  $    -4, <    -6     
       SPL.B  #     0, {    -6     
       MOV.I  @     0, >    -7     
       MOV.I  @     0, >    -8     
       JMP.B  $    -1, {    -9     
       END
