       ORG          1
       DAT.F  <     0, #     0     
       CMP.AB #     0, @    20     
       JMP.B  $     4, $     0     
       MOV.I  @    18, @    14     
       ADD.AB #     5, $    13     
       JMP.B  $    -4, $     0     
       MOV.I  $     9, @    11     
       ADD.AB #     1, $    10     
       MOV.I  $     8, @     9     
       MOV.AB #   100, $    -9     
       DJN.B  $    -1, $   -10     
       MOV.AB #    20, $   -11     
       MOV.AB #     0, <     5     
       DJN.B  $    -1, $   -13     
       JMP.B  $   -13, $     0     
       SPL.B  $     0, $     0     
       JMP.B  $    -1, $     0     
       DAT.F  <     0, #    28     
       END
