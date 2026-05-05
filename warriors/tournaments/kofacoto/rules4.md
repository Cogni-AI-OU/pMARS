   Corewars - King of the Hill 

[![home](http://www.KOTH.org/pics/button-index-off.jpg)](http://www.KOTH.org/index.html)

 

 

[![koth](http://www.KOTH.org/pics/button-koth-off.jpg)](http://www.KOTH.org/koth.html)

[![info](http://www.KOTH.org/pics/button-info-off.jpg)](http://www.KOTH.org/info.html)

[![links](http://www.KOTH.org/pics/button-links-off.jpg)](http://www.KOTH.org/links.html)

[![Newsgroup](http://www.KOTH.org/pics/button-newsgroup-off.jpg)](http://www.KOTH.org/newsgroup.html)

[![Feedback](http://www.KOTH.org/pics/button-feedback-off.jpg)](http://www.KOTH.org/feedback.html)

[![kofacoto!](http://www.KOTH.org/kofacoto/kofacoto.jpg)](http://www.KOTH.org/kofacoto)

The final preliminary round...
Next week, the playoffs begin.

THE CIA HAS BEEN TAKEN HOSTAGE BY JEDIMPS!!  EEEP! :)

That's right, soldier, Round 4 is a hostage situation.
Your mission is to rescue the CIA (Anders Ivner's
C I A stone) from the evil Jedimp army!

Your redcode, CIA, and a modified version of Jedimp
will compete together in a 3-way multiwarrior battle.

--- If CIA dies, you get 0 pts.
Ack the hostages died!!

--- If you die, you get 0 pts.
Hey, yer dead, you don't need pts where you're going.

--- If everyone survives, you get 1 pt.
Noooo!! You can't let those terrorists escape!!

--- If you/CIA survive and Jedimp dies you get 10 pts.
Ahhh... justice is served.

Standard '94 parameters:
pmars.exe -d 100 -c 80000 -p 8000 -l 100 

As always, submit entries to JKW, with the
subject line "KOFACOTO ROUND 4 ENTRY" please.

Entries must be in by November 5th.

--------

;redcode-94
;name Evil Jedimps
;author John K W
;strategy Jedimp for KOFACOTO Round 4
;assert 1

org start

d2    equ 1143;2667
TSTEP equ 3120;1751
bstep equ 2365;1819 ;2283 ;1997
boot  equ 1700-(80+15)*4-1

start	spl     1
        spl     1
        spl	e4
        spl     1
        mov     <b,	{b
b:	jmp     boot,   imp2+1
evol:   spl     @evol,  }TSTEP
        mov.i   }evol,  >evol
evoli:	spl	#d2,	bstep-1
        mov     bomb,	>2
        add.f   evoli,  j
j:      jmp.f   imp2-(d2+1), {-4+bstep
bomb	dat	{1,	{2
imp2    mov.i   #d2,	*0

for 75
dat 0,0
rof

d    equ 2667

e4:	spl	#d,	bstep-1
        add.f   e4,	1
	jmp.f   imp-(d+1), {-4+bstep
imp	mov.i   #d,	*0
end

--------

;redcode-94
;name C I A
;kill C I A
;author Anders Ivner
;assert (CORESIZE == 8000)
;strategy .5c bomber with intelligence bombs

STEP    equ     3119
A       equ     (c-1)
BOFF    equ     2500
SPYOFF  equ     STEP*1400

eye     equ     (A-SPYOFF)
spy     equ     (A+SPYOFF)
bomber  equ     (b0+BOFF)

        org     boot

bpt     dat     bomber-11,bomber
bpt2    dat     (spy+BOFF),0
boot    mov     b0,     @bpt
        mov     {boot,  <bpt
        mov     {boot,  <bpt
        mov     {boot,  <bpt
        mov     {boot,  <bpt
        mov     {boot,  <bpt
        mov     {boot,  <bpt
        mov     {boot,  <bpt
        mov     {boot,  <bpt
        mov     cb,     *bpt
        mov     {-1,    {bpt
        mov     #2000,  {bpt
        mov     spy0,   *bpt2
        spl     @bpt
        mov.f   #0,     bpt
        mov.f   #0,     bpt2

        dat     -1,     15
cb      spl     #-2,    15

start   spl     #0,     <-50
loop    add     c,      @ip
ip      mov     @ip,    @spy
        mov     @ip,    *spy
        jmz.b   loop,   eye
c       spl     #STEP,  <-STEP
        mov     @2,     >b0-13
        mov     @1,     >b0-13
b0      djn.b   -2,     {b0-11

spy0    dat     <-SPYOFF,       <-SPYOFF

i       for     MAXLENGTH-CURLINE
        spl     #i*17,  i*11
        rof

        end