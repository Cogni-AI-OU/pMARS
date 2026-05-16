       ORG          0
       JMZ.F  #  2000, {     0     
       MOV.I  $     4, *    -1     
       MOV.I  $     2, {    -2     
       JMP.B  *    -3, <  -999     
       MOV.I  $     2, >     1     
       JMP.B  $    -1, >    10     
       END
