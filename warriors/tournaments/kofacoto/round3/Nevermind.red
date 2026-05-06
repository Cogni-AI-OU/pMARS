;name HSA-Clone
;author Andy Nevermind
;strategy P.Kline's HSA with different constants
;strategy (testing at the last minute)
;assert 1

       ORG      START
       DAT.F  $100, $-27624     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       MOV.I  $14, <   -14     
       MOV.I  >   -15, >   -15     
       JMN.F  $    -2, >   -16     
START  SUB.X  #   -15, $   -17     
       SNE.I  *   -18, @   -18     
       SUB.X  *3, @    -2     
       JMN.F  $3, @   -20     
       JMZ.F  $    -4, *   -21     
       MOV.X  @    -5, @    -5     
       SLT.B  @    -6, #35     
       DJN.B  $   -10, @    -7     
       DJN.B  *    -3, #28     
       JMP.B  *    -4, }   -12     
       DAT.F  $0, $0     
       SPL.B  #1, {1     
       DAT.F  $0, $0     
       DAT.F  $0, $0     
       DAT.F  $0, $0     