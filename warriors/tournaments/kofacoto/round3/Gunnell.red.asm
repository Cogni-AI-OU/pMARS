       ORG          3
       DAT.F  #     0, #   200     
       MOV.I  $     6, >    -1     
       JMN.F  $    -1, @    -2     
       SNE.I  >    -3, >    -3     
       JMZ.F  $    -1, >    -4     
       SLT.B  $    -5, #    13     
       JMP.B  $    -5, <    -6     
       SPL.B  #     5, #    12     
       ADD.AB #  2117, $    -1     
       MOV.I  *    -2, @    -2     
       JMP.B  $    -2, <   -20     
       DAT.F  #     4, #     5     
       SPL.B  #     4, #     6     
       END
