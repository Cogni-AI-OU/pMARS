;redcode-94
;name Sorry Paul for stealing your code :-)
;author Beppe Bezzi
;assert (CORESIZE==8000) && (MAXLENGTH==100)

; Strategy: 80% f-scanner switches from SPL to DAT carpet
; Strategy: I feel ashamed to write my name on author
; Strategy: considering I changed very little from Paul's HSA

tPtr    dat 100 ,4100-4 ; widely-spaced pointers
        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0
 
tWipe   mov tSpl , >tPtr
        jmn.f tWipe ,>tPtr
 
tScan   sub.x #-12 ,tPtr ; increment and look
tStart  sne *tPtr ,@tPtr
        sub.x *pScan ,@tScan ; increment and look
        jmn.f tSelf ,@tPtr
        jmz.f tScan ,*tPtr

pScan   mov.x @tScan ,@tScan ; swap pointers for attack

tSelf   slt.b @tScan ,#tEnd+4-tPtr ; self-check
        djn tWipe ,@tScan ; go to attack
        djn *pScan ,#13 ; after 13 self-scans
        jmp *pScan ,}tWipe ; switch to dat-wiping
        dat 0,0

tSpl    spl #1,{1
        dat 0,0
        dat 0,0

tEnd    dat 0,0
 
        end tStart
