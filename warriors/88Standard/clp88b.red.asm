       ORG          1
       MOV.AB #    15, @    15     
       MOV.AB #     0, $   -32     
       MOV.AB #     0, $    50     
       MOV.I  $     8, <     8     
       SUB.F  $     1, $     7     
       JMN.B  $     2, @    -3     
       JMZ.B  $    -3, @    -5     
       MOV.I  $     8, $     4     
       MOV.I  <    -8, <     2     
       JMN.B  $    -1, $    -9     
       JMP.B  @     0, $  2049     
       JMP.B  $    -3, $     5     
       SPL.B  $     0, <     1     
       JMP.B  $     1, $  1001     
       MOV.I  $     2, <    -1     
       END
