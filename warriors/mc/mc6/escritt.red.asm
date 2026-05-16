       ORG          0
       LDP.A  #     1, $     4     
       ADD.A  #     1, $     3     
       STP.AB $     2, #     1     
       MOD.A  #     3, $     1     
       JMP.B  @     0, $     3     
       DAT.F  #     0, $     3     
       DAT.F  #     0, $     6     
       MOV.I  #     4, $     1     
       MOV.I  $     3, }    -3     
       MOV.I  $     2, }    -4     
       JMP.B  $    -2, $     0     
       DAT.F  $     7, $     0     
       JMP.B  #     0, <    -3     
       END
