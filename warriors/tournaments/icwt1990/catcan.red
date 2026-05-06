; Fixed ICWS'88 syntax compatibility (commas, DAT modes, and B-operands) for pMARS strict mode.
;
;    Warrior: Cat Can
;  File name: catcan.red
; Tournament: ICWST'90
;   Standard: CWS'88
;     Author: A. Kirchner
;  Assisting: W. Rohmann
;             J. Tenzer
;
start    mov    grave, @dest
        mov    prog, <dest
        sub    #7, dest
        jmn    start, dest
        sub    #4, dest
kill     mov    dest, <dest
        jmn    kill, dest
prog     spl    prog, 0
grave    jmp    grave-1, 0
dest     dat    <0, <dest-16
            end       start
