       ORG         13
       SPL.B  #     1, {     1     
       MOV.I  $    -1, <    -6     
       MOV.I  >    -7, >    -7     
       JMN.F  $    -2, >    -8     
       ADD.AB #     9, @    -2     
       JMZ.F  $    -1, <   -10     
       SLT.B  @    -4, #    20     
       DJN.B  $    -6, @    -5     
       DJN.B  $    -4, #    19     
       JMP.B  $    -5, {    -8     
       DAT.F  $     0, $     0     
       JMP.B  $     0, $     0     
       JMP.B  $     0, $   150     
       ADD.AB #   100, $    -1     
       JMZ.F  $    -1, @    -2     
       JMN.F  #     0, <    -3     
       JMN.F  $    -1, <    -4     
       ADD.AB #  2523, $    -5     
       SUB.BA $    -6, $    -6     
       NOP.F  {    -7, $     0     
       MOV.I  $    -8, @    -8     
       JMP.B  $   -16, $     0     
       END
