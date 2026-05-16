       ORG          3
       DAT.F  #   100, #  4000     
       DAT.F  $     0, $   -10     
       DAT.F  $ -1390, $ -1390     
       JMZ.B  $     0, <    -2     
       ADD.F  @    -3, $    -2     
       ADD.F  $    -3, $    -4     
       MOV.I  $     7, <    -5     
       DJN.B  $    -1, #    20     
       SUB.F  $    -6, $    -7     
       ADD.AB $    -7, $    -8     
       MOV.I  $     3, <    -9     
       DJN.B  $    -1, #    20     
       JMP.B  $     4, $     0     
       SPL.B  #     0, #     0     
       MOV.I  $    10, >   -14     
       JMN.F  $    -1, @   -15     
       SUB.F  $     5, $   -16     
       JMN.F  $     3, @   -17     
       JMZ.F  $    -2, *   -18     
       MOV.X  $   -19, $   -19     
       SLT.B  $   -20, #    24     
       JMP.B  $    -7, #    -7     
       DJN.B  $    -6, #    40     
       JMP.B  $    -7, }    -9     
       SPL.B  #   666, #   999     
       END
