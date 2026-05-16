       ORG          3
       DAT.F  #   100, #  4000     
       MOV.I  $    10, >    -1     
       JMN.F  $    -1, @    -2     
       SUB.F  $     5, $    -3     
       JMN.F  $     3, @    -4     
       JMZ.F  $    -2, *    -5     
       MOV.X  $    -6, $    -6     
       SLT.B  $    -7, #    12     
       JMP.B  $    -7, #    -7     
       DJN.B  $    -6, #    25     
       JMP.B  $    -7, }    -9     
       SPL.B  #   666, #   999     
       END
