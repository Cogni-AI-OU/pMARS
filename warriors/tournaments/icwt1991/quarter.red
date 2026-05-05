; QUARTER by Stefan Hänßgen
; 5th place in 1991 ICWS Tournament
;
;assert CORESIZE==8192
z1      DAT #0, #2062
z2      DAT #0, #4110
z3      DAT #0, #6158

start   MOV     kill,  < z2      ; Copy one killer
        MOV     loop,  < z2      ; .. and ..
        SPL   @ z2               ; .. start it !
        MOV     kill,  < z1      ; No fancy loops here, we
        MOV     loop,  < z1      ;   want speed!
        SPL   @ z1
        MOV     kill,  < z3
        MOV     loop,  < z3
        SPL   @ z3
        JMP     loop             ; Start the fourth killer
ptr     DAT   # 0                ; Pointer to target (not
                                 ; .. copied, since core is
loop    MOV     ptr,   < ptr     ; .. init'ed with "DAT #0")
                                 ; Bomb with DATs ..
kill    DJN     loop,    ptr     ; .. every second location
                                 ; in memory
        END     start
