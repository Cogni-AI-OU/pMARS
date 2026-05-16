;redcode-94
;name Mini He Scans Alone
;author Paul Kline
;strategy component for RMT round 4
;assert (CORESIZE==8000) && (MAXLENGTH==100)

step EQU 9
ptr EQU (bomb-5)

bomb  spl    #1,{1
kill  mov    bomb,<ptr
mptr  mov    >ptr,>ptr
      jmn.f  kill,>ptr
a     add    #step+1,@mptr
scan  jmz.f  a,<ptr
      slt    @mptr,#btm-ptr+3
      djn    kill,@mptr
      djn    a,#16
btm   jmp    a,{kill

      end bomb
