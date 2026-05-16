       ORG          2
       MOV.AB #     0, $    -1     
       JMP.B  $    -1, $     0     
       SPL.B  $    -1, $     0     
       MOV.I  $     6, $   123     
       SPL.B  $   122, $     0     
       MOV.I  <     6, <     5     
       CMP.AB #   -12, $     5     
       JMP.B  $    -2, $     0     
       JMP.B  $   106, $     0     
       MOV.I  $     0, $     1     
       DAT.F  #     0, #   113     
       DAT.F  #     0, #     0     
       END
