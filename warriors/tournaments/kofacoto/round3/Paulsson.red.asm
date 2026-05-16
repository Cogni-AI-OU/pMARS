       ORG          3
       DAT.F  $    24, $    24     
       DAT.F  $  2117, $  3873     
       DAT.F  $    10, $    10     
       SPL.B  #    10, $    10     
       MOV.I  $    -1, *    -4     
       MOV.I  *    -1, @    -5     
       ADD.F  $    -5, $    -6     
       DJN.B  $    -3, #     0     
       JMP.B  $    -3, {    -4     
       DAT.F  $     0, $     0     
       END
