;
;    Warrior: Mr. Beef
;  File name: mrbeef.red
; Torunament: ICWST'90
;   Standard: CWS'88
;     Author: Gerald Frost
;
;  Procedure: win by capturing enemy, and
;                  using them as slaves
;
start    SPL    mrbeef, 0
landpat  MOV    pitguid, runway
        ADD    #1, landpat
        DJN    landpat, leangth
leangth  DAT    <0, <257
pitguid  JMP    -37, 0
here     DAT    <0, <0
        DAT    <0, <0
imper    MOV    bomb, here
        JMP    imper, <here
trap     JMP    -102, #2
bomb     DAT    <0, <0
n        DAT    <0, #77
mrbeef   ADD    #102, net
net      MOV    trap, slave
        DJN    mrbeef, n
        SUB    #7845, net
        MOV    #77, n
        DJN    mrbeef, bigloop
        SPL    pit, 0
        JMP    imper, 0
bigloop  DAT    <0, <34
where    DAT    <0, <here
slave    MOV    bomb, <where    ; haaaa-ha-ha-ha-ha (maniacal laughter)

pit      SPL    slave, 0
        MOV    bomb, <where
        MOV    bomb, <where
        JMP    slave, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
        JMP    pit, 0
runway   JMP    pit, 0          ; that's all fokes!

          END    start
