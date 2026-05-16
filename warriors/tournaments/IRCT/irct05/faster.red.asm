       ORG          0
       MOV.I  $     7, *     5     
       MOV.I  $     7, @     4     
       SPL.B  @     3, $     0     
       ADD.F  $     3, $     2     
       JMP.B  $    -4, $     0     
       DAT.F  $   328, $   329     
       DAT.F  $   328, $   328     
       ADD.AB #    -1, #     1     
       DJN.B  $    -1, $   -10     
       END
