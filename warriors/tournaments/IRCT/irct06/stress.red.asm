       ORG          9
       MOV.I  $     3, >    -4     
       JMP.B  $     1, $     1     
       DJN.B  $    -1, >    -5     
       SUB.F  $     3, $     3     
       DIV.F  $     1, $     1     
       DAT.F  #     0, $    10     
       JMP.B  $    -1, >   -50     
       DIV.F  $     2, $     2     
       SLT.B  $     1, $     1     
       MOV.I  $    -4, {     6     
       MOV.I  $    -4, {     5     
       MUL.X  {   -25, {   -46     
       SUB.X  {   -68, {   -89     
       MOV.I  $   -11, {     2     
       MOV.I  $   -14, {     1     
       JMZ.B  $    80, #     0     
       END
