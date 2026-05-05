;
; quarter ii
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
z1 dat	#0, #2068	; pointer to copies, the killers are
z2 dat	#0, #4115	;  placed at equal distances in memory
z3 dat	#0, #6162	;  formula: zi = i * slen / 4 + dist
                                  				;   where slen = 8192        arena size
                                  				;   and   dist = loop - z1   offset
start mov	loop, <z2	; copy one killer
mov	kill, <z2	;
mov	inc, <z2	;
spl	@z2	; spawn copied killer
mov	loop, <z1	; copy another killer
mov	kill, <z1	;
mov	inc, <z2	;
spl	@z1	; spawn the second killer
mov	loop, <z3	; for the third time, copy and
mov	kill, <z3	;
mov	inc, <z2	;
spl	@z3	; spawn a killer
jmp	loop	; jump to the fourth killer
ptr dat	#0, #0	;
inc add	#4, ptr	;
kill mov	ptr, <ptr	; bomb with dat
loop jmp	loop	; at every other location in the arena
         end     start
