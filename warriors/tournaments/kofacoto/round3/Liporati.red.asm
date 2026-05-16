       ORG          1
       ADD.AB # 16238, # 16253     
       JMZ.F  $    -1, @    -1     
       SLT.AB #    16, $    -2     
       DJN.B  $    -3, #     8     
       JMZ.B  $     6, $    -1     
       MOV.I  $     9, >    -5     
       MOV.I  $     9, @    -6     
       JMP.B  $    -7, <    -7     
       DAT.F  #     0, #     9     
       DAT.F  #   -20, #     9     
       MOV.I  @     3, >    -2     
       MOV.I  @     2, >    -3     
       MOV.I  @     1, >    -4     
       JMP.B  $    -3, $    -4     
       STP.AB #  3465, #  3465     
       DJN.F  $    -1, $    -1     
       END
