       ORG          0
       SPL.B  $     6, $     0     
       MOV.I  $    12, <     4     
       MOV.I  $    10, <     3     
       SPL.B  @     2, $     0     
       SUB.AB #   801, $     1     
       JMP.B  $    -4, $  -100     
       MOV.I  $    10, <     5     
       MOV.I  $     8, <     4     
       MOV.I  $     6, <     3     
       SPL.B  @     2, $     0     
       SUB.AB #   796, $     1     
       JMP.B  $    -5, $   100     
       MOV.I  $    -2, <    -2     
       DJN.B  $    -1, $    -3     
       ADD.AB #    60, $     2     
       MOV.I  $    -2, @     1     
       JMP.B  $    -2, $    -3     
       END
