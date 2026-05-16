       ORG          8
       DAT.F  #     0, #   100     
       JMN.F  #     0, <    -1     
       MOV.I  *    14, >    -2     
       MOV.I  *    13, >    -3     
       MOV.I  *    12, >    -4     
       MOV.I  *    11, >    -5     
       MOV.I  *    10, >    -6     
       JMN.F  $    -5, @    -7     
       ADD.AB #   873, $    -8     
       JMZ.F  $    -1, >    -9     
       SLT.B  @    -2, #    25     
       JMP.B  $   -10, <   -11     
       ADD.AB #    26, @    -4     
       MOV.I  $     2, $    -5     
       JMP.B  $    -6, }     2     
       SNE.I  >    -8, >    -8     
       SPL.B  #     0, }     0     
       SPL.B  #     0, }     0     
       SPL.B  #     0, }     0     
       SPL.B  #     0, }     0     
       DAT.F  >  2286, >  1143     
       DAT.F  >  2286, >  1143     
       DAT.F  >  2286, >  1143     
       END
