       ORG         16
       DAT.F  $   103, $    63     
       DAT.F  $     0, $     0     
       SPL.B  #    47, >    47     
       MOV.I  @     3, >    -3     
       MOV.I  @     2, }    -4     
       MOV.I  @     1, >    -5     
       DJN.B  $    -3, {     8     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $   -40, $    13     
       SPL.B  #  -131, $    16     
       ADD.F  $   -13, $   -15     
       SEQ.I  }   -16, >   -16     
       SNE.I  *   -17, @   -17     
       DJN.B  $    -3, <  -142     
       DJN.F  $   -17, @    -3     
       END
