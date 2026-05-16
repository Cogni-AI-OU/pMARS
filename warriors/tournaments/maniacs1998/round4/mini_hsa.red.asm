       ORG          0
       SPL.B  #     1, {     1     
       MOV.I  $    -1, <    -6     
       MOV.I  >    -7, >    -7     
       JMN.F  $    -2, >    -8     
       ADD.AB #    10, @    -2     
       JMZ.F  $    -1, <   -10     
       SLT.B  @    -4, #    17     
       DJN.B  $    -6, @    -5     
       DJN.B  $    -4, #    16     
       JMP.B  $    -5, {    -8     
       END
