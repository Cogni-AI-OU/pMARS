       ORG          2
       MOV.AB #     0, $    -1     
       JMP.B  $    -1, $     0     
       SPL.B  $    -2, $     0     
       ADD.AB #     8, $     4     
       JMZ.B  $    -1, @     3     
       ADD.F  $    -3, @     2     
       JMP.B  $    -3, $     0     
       DAT.F  #     0, # -3088     
       END
