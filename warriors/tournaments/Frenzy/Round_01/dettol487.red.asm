       ORG         15
       DAT.F  $   310, $   306     
       DAT.F  #   -10, $     9     
       SPL.B  #   -10, $     9     
       MOV.I  @     3, >    -3     
       MOV.I  @     2, >    -4     
       MOV.I  @     1, >    -5     
       DJN.F  $    -3, {    -4     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $    23, $    23     
       ADD.F  $    -1, $   -14     
       SNE.I  @   -15, *   -15     
       DJN.F  $    -2, <   234     
       JMP.B  $   -15, <   -17     
       END
