       ORG          0
       ADD.F  #     1, }     1     
       MUL.A  #     1, $     1     
       ADD.AB #     1, #     1     
       JMZ.F  $    -1, @    -1     
       MOV.B  @    -1, #     1     
       MOV.I  @     1, >    -1     
       JMP.B  $    -1, >     1     
       DAT.F  $     1, $     1     
       END
