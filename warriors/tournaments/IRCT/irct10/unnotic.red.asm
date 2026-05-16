       ORG          1
       ADD.B  $     2, $     1     
       JMZ.F  $    -1, $    24     
       SPL.B  $     0, $    12     
       MOV.F  $     2, >    -2     
       DJN.F  $    -1, >    -3     
       DAT.F  $    40, $     8     
       END
