       ORG          0
       MOV.I  {     7, {     5     
       MOV.I  {     6, {     4     
       MOV.I  {     5, {     3     
       MOV.I  {     4, {     2     
       MOV.I  {     3, {     1     
       SPL.B  @     0, $  4000     
       MOV.I  $     0, $    -6     
       DAT.F  $    10, $     0     
       SPL.B  #   -45, $    45     
       SUB.F  $     5, @     3     
       MOV.I  $     3, *   -42     
       MOV.I  $    -2, @    -1     
       MOV.I  $     3, *    -2     
       DJN.F  $    -4, { -2000     
       DAT.F  >   135, >   135     
       MOV.I  {   -45, $     1     
       END
