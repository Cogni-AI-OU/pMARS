;
; quarter
;
; by stefan hanbgen
;
; copies a killer to every quater of the core, and splits into four
; processes, each one bombing its slice of memory.  not very subtle,
; but quite powerful since the killers produce a bomb with every
; second instruction, and are difficult to hit.  the killers destroy
; each other after they have bombed through their quater, but the
; battle should be decided before this happens.  speed is the
; important factor.
;
z1 dat	#0, #2062	; pointer to copies, the killers are
z2 dat	#0, #4110	;  placed at equal distances in memory
z3 dat	#0, #6158	;  formula: zi = i * slen / 4 + dist
                                  				;   where slen = 8192        arena size
                                  				;   and   dist = loop - z1   offset
start mov	kill, <z2	; copy one killer
mov	loop, <z2	;
spl	@z2	; spawn copied killer
mov	kill, <z1	; copy another killer
mov	loop, <z1	;
spl	@z1	; spawn the second killer
mov	kill, <z3	; for the third time, copy and
mov	loop, <z3	;
spl	@z3	; spawn a killer
jmp	loop	; jump to the fourth killer
ptr dat	#0, #0	;
loop mov	ptr, <ptr	; bomb with dat
kill djn	loop, ptr	; at every other location in the arena
         end     start

;