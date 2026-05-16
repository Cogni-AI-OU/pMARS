       ORG          0
       DJN.B  #     0, #    50     
       JMZ.B  #     0, <     5     
       ADD.AB #  2667, $     4     
       JMN.B  $    -1, @     3     
       JMZ.B  #     0, @     2     
       SUB.AB #     1, $     1     
       MOV.I  $     2, $   -10     
       JMP.B  #     0, $     0     
       MOV.I  #     0, >  2667     
       END
