       ORG         15
       SPL.B  $     2, <   100     
       SPL.B  $     0, <   200     
       SPL.B  $     0, <   300     
       SPL.B  @     0, >   120     
       MOV.I  }     0, >     0     
       MOV.I  $     3, >   400     
       MOV.I  {    -3, <     0     
       JMZ.A  @     0, $  -320     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       NOP.F  }   -14, }   -13     
       NOP.F  {   -12, <   -12     
       NOP.F  }    -9, >    -9     
       JMP.B  $   -18, >   -12     
       END
