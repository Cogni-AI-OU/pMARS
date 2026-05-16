       ORG          0
       SPL.B  $     5, $     0     
       MOV.AB #     0, $    -1     
       MOV.AB #     1, <    -2     
       DJN.B  $    -1, $     1     
       DAT.F  #     0, #    41     
       MOV.I  $     8, @    10     
       ADD.AB #    18, $     9     
       MOV.I  $     7, @     8     
       ADD.AB #    23, $     7     
       DJN.B  $    -4, @     6     
       MOV.AB #     1, @     5     
       ADD.AB #   820, $     4     
       JMP.B  $    -7, $     0     
       SPL.B  $     0, $     0     
       JMP.B  $   -18, $     0     
       DAT.F  #     0, #  2048     
       END
