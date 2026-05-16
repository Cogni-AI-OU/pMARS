       ORG          1
       MOV.F  #     2, @     1     
       MOV.F  }     5, @     5     
       MUL.B  $     4, >     4     
       JMN.F  $    -2, *     3     
       MOV.F  *     2, @     2     
       DJN.B  $    -5, #     1     
       JMP.B  #     2, $     1     
       DAT.F  $     1, $     3     
       DAT.F  $     1, $     2     
       DAT.F  $     2, $     5     
       DAT.F  $     1, $     1     
       END
