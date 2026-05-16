       ORG          0
       MOV.I  $     8, @     9     
       MOV.I  $     6, <     8     
       SUB.AB #     7, $     7     
       JMN.B  $    -3, $     6     
       SUB.AB #     4, $     5     
       MOV.I  $     4, <     4     
       JMN.B  $    -1, $     3     
       SPL.B  $     0, $     0     
       JMP.B  $    -1, $     0     
       DAT.F  <     0, <   -16     
       END
