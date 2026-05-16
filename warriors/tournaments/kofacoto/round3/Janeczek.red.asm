       ORG          6
       ADD.A  #  2118, $     4     
       MOV.I  @    -1, {     3     
       JMP.B  $    -2, {    -4     
       DAT.F  $    -5, {  2117     
       SPL.B  # -2116, $     3     
       SUB.A  #    13, $     3     
       JMZ.F  $    -1, *     2     
       ADD.A  #    13, $     1     
       DJN.F  #   -13, {     0     
       JMN.F  $     3, {    -1     
       SUB.A  #   373, $    -2     
       JMZ.F  $    -1, *    -3     
       SNE.I  *    -4, {    -4     
       JMP.B  $    -3, {   -15     
       MOV.I  <     2, {    -6     
       DJN.B  $    -1, #     5     
       JMP.B  *    -8, $   -11     
       END
