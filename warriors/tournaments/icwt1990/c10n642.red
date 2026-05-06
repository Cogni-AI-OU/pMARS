; Fixed ICWS'88 syntax compatibility (commas, DAT modes, and B-operands) for pMARS strict mode.
;
;    Warrior: C10n642
;  File name: c10n642.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: John R. Perry
;
        DAT    <1384, <6852
        JMP    $65534, $61706
        JMP    $65532, <63406
        JMP    $65532, <63406
        CMP    @65505, $65507
        MOV    @65533, @65527
        CMP    @17, @13
start    JMZ    $3, $4
        MOV    @65535, <65520
        MOV    @65533, @65527
        MOV    <65533, <65527
        MOV    @65535, <65520
        DJN    $65535, $65532
        CMP    @65528, @65533
        MOV    @65535, <65520
        DJN    $65535, $65532
        ADD    $2, <206
        MOV    $1, <4489
        JMP    $65532, <63406
        SUB    $2, @2
        JMZ    $6, #7
        JMP    $1, <6494
        JMP    $65532, <63406
        JMN    $65530, #65534
        JMZ    $65534, @65531
        JMP    $65534, $61706
        SUB    <65533, <65520
        CMP    @17, @13
        DJN    $65535, $65532
        JMP    $65534, $62604
        ADD    #5, <0
        SUB    #1, <0
        CMP    $34, $33
        DAT    <61165, <60963
        DJN    <1, $5
        DAT    <6466, <4542
        SUB    #65532, $62948
        ADD    $2, <0
        JMZ    <65529, $65530
        ADD    #5, <0
        DJN    $65535, $65532
        JMP    $65532, <63406
        DAT    <61763, <60566
        DAT    <7661, <2576
        SUB    #65531, <65527
        SPL    $0, <788
        JMP    $65532, <63406
        CMP    <3, <22
        SPL    <6, $1155
        MOV    @65533, @65527
        MOV    @65535, <65520
        DJN    $65535, $65532
        DJN    <4, @3
        JMZ    $6, #7
        SUB    #2, <14
        ADD    $1, @6852
        JMP    <3, @2392
        DJN    <65529, $65534
        DAT    <19, <7
        ADD    #65532, <61306
        DAT    <4579, <6683
        CMP    @65528, @65533
        DAT    <65493, <65513
        CMP    #16, 8
        CMP    @17, @13
         END         start
