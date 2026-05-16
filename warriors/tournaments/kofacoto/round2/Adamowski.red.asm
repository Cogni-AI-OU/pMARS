       ORG          0
       SPL.B  $     1, <  2000     
       SPL.B  $     1, <  4000     
       SPL.B  $     1, < -2000     
       MOV.I  $     5, <     5     
       MOV.I  $     4, <     4     
       MOV.I  $     3, <     3     
       DJN.B  $    -3, #  2664     
       MOV.I  $     0, $     1     
       DAT.F  #     0, #    -8     
       END
