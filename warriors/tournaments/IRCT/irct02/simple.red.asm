       ORG          6
       SPL.B  #  -105, >   105     
       MOV.I  >  -210, $   211     
       ADD.F  $    -2, $     0     
       DJN.F  $    -2, >   102     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       NOP.F  <    -4, }     3     
       NOP.F  }     3, }     4     
       SPL.B  $    -8, >  -430     
       SPL.B  $     0, >  -410     
       SPL.B  $     0, <  -390     
       SPL.B  $     0, }  -370     
       SPL.B  $     5, {  -350     
       DJN.F  $     6, {  -300     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       ADD.F  #   267, $    -4     
       DAT.F  $     0, $     0     
       MOV.I  #   267, *     0     
       END
