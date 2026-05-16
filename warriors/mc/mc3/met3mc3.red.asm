       ORG          4
       JMZ.B  $     0, $ -2669     
       NOP.F  $     0, $     0     
       MOV.I  #     1, <     1     
       JMP.B  #     0, $ -2672     
       SEQ.I  @     8, *     8     
       JMP.B  $    -5, $     0     
       SNE.I  <     6, {     6     
       SEQ.I  <     5, {     5     
       JMP.B  $     3, $     0     
       DJN.B  $    -3, #     5     
       JMP.B  $   -10, $     0     
       SNE.I  $     4, @     1     
       MOV.X  # -2669, #  2664     
       MOV.I  $     2, <    -1     
       JMP.B  #     0, $     0     
       END
