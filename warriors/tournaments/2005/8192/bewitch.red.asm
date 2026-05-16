       ORG          3
       MOV.I  $     5, >     2     
       MOV.I  $     2, @     1     
       ADD.AB #  3199, #  3203     
       JMZ.F  $    -1, @    -1     
       DJN.B  $    -4, $    -2     
       SPL.B  #     0, $     0     
       MOV.I  $     2, >    -3     
       DJN.F  $    -1, >    -4     
       DAT.F  <  2731, $     7     
       END
