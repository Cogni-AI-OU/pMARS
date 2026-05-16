;redcode-94
;name Carbonite
;author Christian Schmidt
;strategy component for RMT round 4
;assert (CORESIZE==8000) && (MAXLENGTH==100)

dbomb   dat     >-1, >1
start   spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1                ; gets bombed to start coreclear
        djn.f   -2, <-1151

        end start
