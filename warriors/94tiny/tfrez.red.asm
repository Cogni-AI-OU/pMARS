       ORG          1
       ADD.F  $    10, $     1     
       SNE.I  $    80, $    85     
       DJN.F  $    -2, {  -115     
       MOV.AB $    -2, $    -4     
       SPL.B  $    -4, $   -40     
       MOV.I  *     3, >    -6     
       MOV.I  *     2, >    -7     
       DJN.F  $    -2, <    -3     
       DAT.F  $     1, $    11     
       SPL.B  #    10, $    10     
       SPL.B  #    70, $    70     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       SPL.B  #    21, <    50     
       SPL.B  #    22, <    50     
       SPL.B  #    23, <    50     
       SPL.B  #    24, <    50     
       SPL.B  #    25, <    50     
       SPL.B  #    26, <    50     
       END
