       ORG          5
       NOP.F  $     0, $ 10000     
       MOV.I  $    16, >    -1     
       JMN.F  $    -1, @    -2     
       ADD.AB #  3508, $    -3     
       ADD.AB #     6, $    -4     
       JMZ.B  $    -1, @    -5     
       SLT.AB #    20, $    -6     
       JMP.B  $    -3, $     0     
       DJN.B  $    -7, #   120     
       MOV.I  $     7, <    -1     
       DJN.B  $    -1, #   -11     
       ADD.B  $     3, $     4     
       MOV.I  *    -1, <     3     
       JMP.B  $    -2, $     0     
       SPL.B  #     4, $-21322     
       DAT.F  $     0, $     0     
       STP.AB #     5, #   100     
       SPL.B  #     0, {     0     
       END
