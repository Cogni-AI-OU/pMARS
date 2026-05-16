       ORG          8
       DAT.F  $     0, $     8     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  #     8, #     8     
       ADD.F  $    -1, $     1     
       SNE.I  $     1, $     5     
       JMP.B  @   -10, <    -5     
       MOV.I  $     6, >    -2     
       MOV.I  $     5, >    -3     
       MOV.I  $     4, >    -4     
       MOV.I  $     3, >    -5     
       MOV.I  $     2, >    -6     
       SPL.B  $    -5, $     0     
       DAT.F  <   -12, <   267     
       END
