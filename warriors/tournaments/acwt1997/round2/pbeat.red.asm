       ORG          1
       DAT.F  $     5, $ -3950     
       MOV.I  }    -1, >    -1     
       DJN.B  $    -1, #    19     
       SPL.A  $ -3949, $     0     
       JMP.A  $     5, $     0     
       DAT.F  $     0, $     0     
       STP.AB #     0, #   250     
       DAT.F  $   100, $  -100     
       DAT.F  $    97, $  -103     
       SEQ.I  $    -4, @    -1     
       JMP.A  $     6, $     0     
       SEQ.I  $    -6, *    -3     
       JMP.A  $     3, $     0     
       ADD.F  $    -6, $    -5     
       JMP.A  $    -5, $     0     
       MOV.AB $    -7, $    -7     
       ADD.AB #  4000, $    -8     
       MOV.BA $    -9, $    -9     
       MOV.I  $   -12, <   -10     
       MOV.I  $   -13, }   -11     
       DJN.B  $    -2, #   100     
       MOV.I  $   -16, >   -13     
       MOV.I  $   -17, {   -14     
       JMP.A  $    -2, $     0     
       END
