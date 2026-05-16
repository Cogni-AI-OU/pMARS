       ORG          1
       SPL.B  #     3, $     0     
       ADD.AB #    10, $     1     
       JMZ.B  $    -1, $    99     
       SPL.B  #     6, $     6     
       MOV.I  *    -4, >    -2     
       DJN.B  $    -1, <    -9     
       DAT.F  #     0, $     5     
       END
