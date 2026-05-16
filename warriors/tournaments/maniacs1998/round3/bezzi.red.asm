       ORG          9
       DAT.F  $   100, $ -3904     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       MOV.I  $    13, >    -6     
       JMN.F  $    -1, >    -7     
       SUB.X  #   -12, $    -8     
       SNE.I  *    -9, @    -9     
       SUB.X  *     3, @    -2     
       JMN.F  $     3, @   -11     
       JMZ.F  $    -4, *   -12     
       MOV.X  @    -5, @    -5     
       SLT.B  @    -6, #    26     
       DJN.B  $    -9, @    -7     
       DJN.B  *    -3, #    13     
       JMP.B  *    -4, }   -11     
       DAT.F  $     0, $     0     
       SPL.B  #     1, {     1     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       END
