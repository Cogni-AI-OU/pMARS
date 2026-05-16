       ORG          5
       SPL.B  #     1, }     1     
       MOV.I  $    -1, <    -7     
       MOV.I  >    -8, >    -8     
       JMN.F  $    -2, >    -9     
       ADD.AB #     8, @    -2     
       JMZ.F  $    -1, <   -11     
       SLT.B  @    -4, #    20     
       JMP.B  $    -6, <   -13     
       DJN.B  $    -4, #    13     
       JMP.B  $    -5, {    -8     
       DAT.F  $     0, $     0     
       END
