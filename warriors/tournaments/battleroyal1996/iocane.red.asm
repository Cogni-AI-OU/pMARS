       ORG          0
       MOV.I  {     7, {     5     
       MOV.I  {     6, {     4     
       MOV.I  {     5, {     3     
       MOV.I  {     4, {     2     
       MOV.I  {     3, {     1     
       SPL.B  @     0, $  4000     
       MOV.I  $     0, $    -6     
       DAT.F  $     6, $     0     
       SPL.B  #  3044, < -3044     
       SUB.F  $    -1, $     1     
       MOV.I  $    -2, *  3044     
       DJN.F  $    -2, < -2000     
       DAT.F  $     0, $     0     
       END
