       ORG          2
       DAT.F  #     0, #    11     
       DAT.F  #     0, #    -2     
       SPL.B  $     5, $     0     
       JMZ.B  $     2, @    -3     
       SPL.B  @    -4, $     0     
       ADD.AB #     1, $    -5     
       JMP.B  $    -3, $     0     
       JMZ.B  $     2, @    -6     
       SPL.B  @    -7, $     0     
       SUB.AB #     1, $    -8     
       JMP.B  $    -3, $     0     
       END
