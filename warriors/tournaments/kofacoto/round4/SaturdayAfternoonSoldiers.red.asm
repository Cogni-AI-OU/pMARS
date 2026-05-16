       ORG          2
       DAT.F  $   100, $     0     
       JMP.B  $     0, $     0     
       ADD.A  #   100, $    -2     
       JMZ.F  $    -1, *    -3     
       SUB.A  #    10, $    -4     
       JMN.F  $    -1, *    -5     
       ADD.A  #    10, $    -6     
       JMN.F  #     0, {    -7     
       MOV.AB $    -8, $    -7     
       SNE.I  $     8, @    -8     
       JMP.B  $     4, $     0     
       SNE.I  $     7, @   -10     
       JMP.B  $     3, $     0     
       JMP.B  $   -11, $     0     
       ADD.AB #  2520, $   -13     
       ADD.AB #     5, $   -14     
       JMP.B  @   -15, $     0     
       DAT.F  $     0, $   -16     
       SPL.B  #     0, <   -50     
       JMP.B  $    -1, $     1     
       END
