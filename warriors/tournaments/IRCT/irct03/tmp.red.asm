       ORG          0
       DJN.F  $     1, @     1     
       NOP.F  {     1, {     1     
       MUL.AB #    -1, #    -1     
       SPL.B  $     1, $    -1     
       MOV.B  @    -1, @     1     
       SPL.B  $     1, $     1     
       SPL.B  @     0, $     0     
       MOV.I  }    -1, >    -1     
       JMP.B  @    -1, $     0     
       END
