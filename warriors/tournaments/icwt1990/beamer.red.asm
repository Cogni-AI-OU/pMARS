       ORG          4
       MOV.AB #     0, $    -1     
       SPL.B  $    -1, $     0     
       JMP.B  $    -2, $     0     
       DAT.F  <     0, <  1000     
       MOV.I  $    10, @    -1     
       ADD.AB #     5, $    -2     
       SUB.AB #     5, $     8     
       JMN.B  $    -3, $    -4     
       ADD.AB #    15, $    -5     
       SUB.AB #    15, $     5     
       DJN.B  $    -6, $     3     
       MOV.AB #     0, $   -10     
       JMP.B  $    -8, $     0     
       DAT.F  <     0, #     2     
       JMP.B  $ -1002, $     0     
       END
