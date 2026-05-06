       ORG         14
       DAT.F  $  -256, $   163     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $  -212, $     9     
       SPL.B  #   300, $    10     
       MOV.I  @     3, >    -5     
       MOV.I  @     2, >    -6     
       MOV.I  @     1, }    -7     
       DJN.B  $    -3, {    -4     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       ADD.F  $     6, @     2     
       SNE.I  *   -14, @   -14     
       ADD.F  $     4, $   -15     
       SNE.I  *   -16, @   -16     
       DJN.F  $    -4, @   -17     
       DJN.F  $   -14, $   -18     
       DAT.F  >    12, >    12     
       END
