       ORG          0
       SPL.B  $     2, <   200     
       SPL.B  $     1, <   400     
       SPL.B  $     1, <  -200     
       SPL.B  @     0, <   102     
       MOV.I  }    -1, >    -1     
       MOV.I  }    -2, >    -2     
       SPL.B  @     0, <   305     
       MOV.I  }    -1, >    -1     
       MOV.I  $     3, }  -332     
       MOV.I  {    -3, {     1     
       JMZ.A  $   350, *     0     
       DAT.F  <     1, {     1     
       END
