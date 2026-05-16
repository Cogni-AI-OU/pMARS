       ORG          3
       MOV.I  #    70, $     1     
       SPL.B  *    -1, <    -9     
       ADD.A  #    70, $    -2     
       MOV.I  $    -3, *    -3     
       DJN.F  $    -3, <   -10     
       END
