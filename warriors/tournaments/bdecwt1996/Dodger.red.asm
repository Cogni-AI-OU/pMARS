       ORG          0
       SNE.I  }     5, $   -12     
       JMZ.F  $    -1, }     4     
       ADD.A  #     2, $     3     
       MOV.I  {     5, {     2     
       DJN.B  $    -1, #     4     
       SPL.B  $  2234, {     0     
       MOV.I  $     2, {    -1     
       DAT.F  {    -2, {    -2     
       DAT.F  $     5, $    20     
       SPL.B  #     0, >    -2     
       MOV.I  $     2, >    -3     
       DJN.F  $    -1, >    -4     
       DAT.F  <  2667, $     9     
       END
