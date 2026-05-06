       ORG         11
       DAT.F  $   247, $   241     
       DAT.F  $     0, $     0     
       DAT.F  $     1, $    10     
       SPL.B  #  2000, $    15     
       MOV.I  *    -2, >    -4     
       MOV.I  *    -3, >    -5     
       DJN.F  $    -2, }    -3     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       SNE.I  *   -11, @   -11     
       ADD.F  $     5, $   -12     
       SNE.I  *   -13, @   -13     
       ADD.F  $     3, {   -13     
       JMN.B  $    -4, }   -14     
       DJN.F  $   -13, $   -16     
       DAT.F  $   230, $   230     
       END
