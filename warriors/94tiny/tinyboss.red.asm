       ORG          1
       SUB.F  $     3, $     1     
       SNE.I  $    35, $    30     
       DJN.B  $    -2, #    79     
       SPL.B  #   -30, <   -30     
       MOV.I  @     2, >    -3     
       MOV.I  @     1, >    -4     
       DJN.F  $    -2, {     2     
       DAT.F  #   -10, $     7     
       SPL.B  #   -10, $     8     
       END
