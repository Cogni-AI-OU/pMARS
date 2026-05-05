; Fixed ICWS'88 syntax compatibility (commas, DAT modes, and B-operands) for pMARS strict mode.
;
;    Warrior: Lightning
;  File name: lightnin.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: C. Butcher / New Zealand
;
num      dat    <0, #0
start    spl    copy, 0
        cmp    #0, @a           ; was CMP @ a  # 0 - CWS'88 violation - WRB/ICWS.DO

        jmp    bomb, 0
        add    #5, a
        jmp    start+1, 0
bomb     mov    #20, bombnum
        sub    #10, a
        mov    #0, <a
        djn    -1, bombnum
        add    #20, a
        jmp    start+1, 0
a        dat    <0, #10
address  dat    <0, #-833
copy     mov    #20, num
        mov    @num, <address
        djn    -1, num
        spl    @address, 0
        sub    #653, address
bombnum  dat    <0, #0
          end    start
