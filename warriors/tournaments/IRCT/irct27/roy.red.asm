       ORG          7
       DAT.F  $   100, $ -3600     
       DAT.F  $   -14, $   -10     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       MOV.I  $    12, <    -4     
       MOV.I  >    -5, >    -5     
       JMN.F  $    -2, >    -6     
       SUB.X  $    -6, $    -7     
       SNE.X  *    -8, >    -8     
       SUB.X  *     3, @    -2     
       JMN.F  $     3, <   -10     
       JMZ.F  $    -4, *   -11     
       MOV.X  @    -5, @    -5     
       SLT.B  @    -6, #    23     
       DJN.B  $   -10, @    -7     
       DJN.B  *    -3, #    10     
       SPL.B  #     0, }     0     
       MOV.I  $     2, >    -4     
       DJN.F  $    -1, {    -5     
       DAT.F  >     1, $     8     
       END
