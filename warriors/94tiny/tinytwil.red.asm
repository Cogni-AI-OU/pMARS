       ORG         10
       DAT.F  $   134, $   128     
       DAT.F  $     0, $     0     
       DAT.F  $     1, $     9     
       SPL.B  #   350, $    12     
       MOV.I  *    -2, >    -4     
       MOV.I  *    -3, >    -5     
       DJN.F  $    -2, }    -3     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       ADD.F  $     4, $    -9     
       SNE.I  *   -10, @   -10     
       DJN.F  $    -2, *   -11     
       DJN.F  $    -9, $   -12     
       DAT.F  $    24, $    24     
       END
