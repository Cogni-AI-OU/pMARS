       ORG         12
       NOP.F  $    42, $     0     
       NOP.F  $    42, $     0     
       NOP.F  $    42, $     0     
       NOP.F  $    42, $     0     
       NOP.F  $    15, $     0     
       MOV.I  $     6, }    -1     
       DJN.B  $    -1, $    -2     
       DJN.A  $    -2, $    -2     
       DAT.F  $     1, $     1     
       DAT.F  $     1, $     1     
       DAT.F  #    14, $     1     
       DAT.F  #    14, $     1     
       SPL.B  $    -7, $     0     
       DJN.B  #     0, $   -13     
       NOP.F  <   -12, <   -11     
       JMP.B  $    -2, <   -14     
       DAT.F  $     1, $     1     
       DAT.F  $     1, $     1     
       DAT.F  $     1, $     1     
       END
