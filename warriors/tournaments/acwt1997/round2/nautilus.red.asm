       ORG          2
       DAT.F  $     5, $     5     
       DAT.F  $    26, $    26     
       ADD.F  $    -1, @     2     
       MOV.I  $    -3, @     2     
       MOV.I  $    -4, *     1     
       SNE.I  *   100, @   113     
       JMP.B  $    -4, < -1000     
       MOV.AB $    -2, $     2     
       SPL.B  $     7, $     0     
       SPL.B  #     5, $    13     
       MOV.I  *    -1, >    -1     
       DJN.B  $    -1, {  -100     
       DAT.F  #     3, $    13     
       SPL.B  #     3, $    13     
       SPL.B  #     4, $    13     
       MOV.AB $   -10, $     2     
       ADD.AB #  3960, $     1     
       SPL.B  #    -3, $     5     
       MOV.I  *    -1, >    -1     
       DJN.B  $    -1, #  1000     
       DAT.F  $     0, $     0     
       END
