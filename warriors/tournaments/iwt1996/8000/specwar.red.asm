       ORG          2
       MOV.I  $     0, $     1     
       SUB.F  $     9, $     1     
       SEQ.I  $   104, $   110     
       SLT.AB #    16, $    -1     
       JMP.B  $    -3, <    -9     
       SUB.B  $     7, #    -3     
       MOV.I  $    -6, <    -4     
       SPL.B  @    -5, {  1000     
       SUB.A  #    15, $    -6     
       JMN.A  $    -8, $    -8     
       DAT.F  #  -111, <  -111     
       END
