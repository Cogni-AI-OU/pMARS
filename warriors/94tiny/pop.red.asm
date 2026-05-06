       ORG         17
       SUB.F  $     5, $     1     
       SNE.I  $    23, $    15     
       SUB.F  $     3, $    -1     
       SNE.I  *    -2, @    -2     
       DJN.B  $    -4, {   -70     
       SPL.B  #   -16, $   -16     
       MOV.I  @     3, >    -5     
       MOV.I  @     2, >    -6     
       MOV.I  @     1, >    -7     
       DJN.F  $    -2, {     3     
       DAT.F  $   -11, $    11     
       DAT.F  $   -12, $    12     
       SPL.B  #   -54, $    12     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       MOV.I  <  -106, {  -108     
       MOV.I  <  -108, <  -110     
       DJN.F  $   -18, {  -113     
       END
