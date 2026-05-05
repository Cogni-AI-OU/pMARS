;
;    Warrior: Net
;  File name: Net.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: Sasha Wait
;     Branch: Lisgar Collegiate Institute
;
        JMP    seek, 0
srch     DAT    <0, <1
        JMP    trap, 0
seek     ADD    #61, srch
        JMZ    seek, <srch
        MOV    srch, scn
detour   JMP    newScan, 0
newScan  SPL    scan, scan
        MOV    rstLoop, detour
rstLoop  JMP    -3, 0
stn      SPL    stn, stn
net      JMP    @net, -2
splt     SPL    trap, trap
        MOV    zero, <smash
        JMP    splt, 0
trap     DJN    splt, count
        MOV    zero, splt
scn      DAT    <0, <1024
zero     DAT    <0, <0
plcTrap  ADD    #1, scn
        MOV    net, @scn
        SUB    scn, @scn
        JMP    next, 0
stun     MOV    stn, @scn
next     JMN    stun, <scn
        MOV    stn, @scn
        JMP    scan, 0
reset    MOV    #-16, scn
scan     JMZ    scan, <scn
        CMP    smash, @scn
        JMP    plcTrap, 0
count    JMP    reset, 64
smash    JMP    reset, srch
          END seek
