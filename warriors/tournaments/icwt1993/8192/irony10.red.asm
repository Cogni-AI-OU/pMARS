       ORG          3
       ADD.AB #    12, $     3     
       MOV.AB #    12, $     6     
       ADD.F  $     9, $     1     
       CMP.I  $   -80, $   -70     
       SLT.AB #    22, $    -1     
       DJN.B  $    -3, < -3503     
       MOV.I  $     3, <    -3     
       DJN.B  $    -1, #    12     
       JMZ.B  $    -8, $    -9     
       SPL.B  $     0, <   -77     
       MOV.I  $     1, <    -3     
       DAT.F  <   -78, <   -78     
       END
