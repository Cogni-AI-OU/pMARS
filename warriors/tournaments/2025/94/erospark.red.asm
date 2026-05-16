       ORG          5
       DAT.F  #     0, #     0     
       DAT.F  #  -200, #     5     
       SPL.B  #     1, {    -5     
       MOV.I  $    -2, >    -3     
       DJN.B  $    -1, >    -4     
       ADD.AB #   511, $     8     
       JMZ.F  $    -1, @     7     
       JMZ.B  $    -5, $     6     
       JMZ.B  $    -6, #   100     
       SLT.B  $     4, #   -14     
       JMP.B  $    -5, $     0     
       MOV.I  $    -9, >     2     
       SPL.B  $    -7, <    -4     
       MOV.I  $    -7, $     1     
       END
