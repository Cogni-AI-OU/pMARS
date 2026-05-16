       ORG          4
       SPL.B  #  2667, {     1     
       MOV.I  $    -1, }    -1     
       JMN.F  $    -1, *    -2     
       ADD.A  #    10, $    -3     
       JMZ.F  $    -1, {    -4     
       SLT.AB $    -5, #     9     
       DJN.A  $    -5, $    -6     
       DJN.B  $    -4, #    12     
       JMP.B  $    -5, {    -7     
       END
