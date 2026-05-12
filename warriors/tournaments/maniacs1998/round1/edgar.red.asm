       ORG          1
       SPL.B  #     1, $ -3000     
       MOV.I  @     0, >    -1     
       SUB.F  $     4, $     1     
       CMP.I  $     4, $     0     
       MOV.AB $    -1, @    -3     
       DJN.B  $    -4, #  1002     
       SPL.B  #   152, #   152     
       MOV.I  $     2, >   -12     
       DJN.F  $    -1, >   -13     
       DAT.F  >  2667, #    15     
       END
