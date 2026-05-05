;redcode
;name MinuteMan
;author Lukasz Adamowski
;assert CORESIZE==8192 && MAXLENGTH==300 ; Added round-specific settings for Redcoders Frenzy Round 15

start	spl	1
	spl	1
	spl	1
	mov	<8,	<1
	spl	@0,	$1111
	mov	<8,	<1
	spl	@0,	$121
	mov	$4,	<-1
	mov	$3,	<-2
	djn	$-1,	<-3
	mov.i	#0,	1

	end	start
