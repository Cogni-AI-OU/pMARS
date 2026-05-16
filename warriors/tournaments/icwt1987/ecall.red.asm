       ORG          0
       MOV.I  $     4, @     7     
       ADD.AB #     8, $     6     
       MOV.I  $     6, $    10     
       JMP.B  $    -3, $     0     
       JMP.B  $    -8, $     0     
       DAT.F  #     0, #    64     
       DAT.F  #     0, #   -30     
       DAT.F  #     0, #    13     
       JMP.B  $    -3, $     0     
       SPL.B  $     0, $     0     
       DJN.B  $     2, $    -5     
       JMP.B  $     2, $     0     
       JMP.B  $    -3, $     0     
       MOV.I  $    -4, @     8     
       CMP.AB #    30, $     7     
       DJN.B  $    -3, $     6     
       MOV.AB #   -30, $     5     
       JMP.B  $     2, $     0     
       JMP.B  $    -8, $     0     
       SPL.B  $   -10, $     0     
       JMP.B  $    -8, $     0     
       DAT.F  #     0, #   -30     
       END
