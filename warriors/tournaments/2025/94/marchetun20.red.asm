       ORG          0
       SPL.B  $     8, $     0     
       SPL.B  $    14, $     0     
       SPL.B  $    18, $     0     
       JMP.B  $     1, $     0     
       ADD.AB #    15, $     3     
       MOV.I  $     2, @     2     
       JMP.B  $    -2, $     0     
       DAT.F  #     4, #     0     
       MOV.I  @     6, $     5     
       JMZ.B  $     4, $     2     
       MOV.AB #    88, @     4     
       ADD.AB #     5, $     3     
       JMP.B  $    -4, $     0     
       DAT.F  #     0, #     0     
       DAT.F  #     3, #     0     
       ADD.AB #     7, $     4     
       MOV.I  $     3, @     3     
       ADD.AB #     3, $     2     
       JMP.B  $    -3, $     0     
       DAT.F  #     1, #     0     
       MOV.I  @    -2, $     3     
       ADD.AB #     2, $     2     
       JMP.B  $    -2, $     0     
       DAT.F  #    66, #     0     
       END
