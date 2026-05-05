Corewars - King of the Hill    

[![](../pics/button-index-off.jpg)](../README.md) [![](../pics/button-koth-off.jpg)](../koth.md) [![](../pics/button-info-off.jpg)](../info.md) [![](../pics/button-links-off.jpg)](../links.md) [![](../pics/button-newsgroup-off.jpg)](../newsgroup.md) [![](../pics/button-feedback-off.jpg)](../feedback.md)

[![kofacoto!](http://www.KOTH.org/kofacoto/kofacoto.jpg)](http://www.KOTH.org/kofacoto)

**Round 5, Comments by Robert Macrae**

Day 1  
  
Hi Paul.  
  
I remember I came in one point ahead of you for three rounds running in NSFCWT, my very first tournament... maybe the margin has closed up a bit since ;-)  
  
The good side of this match is that Paul has been around longer than I have, so I know more about him that he knows about me. The bad side is that he has done much more than I have, and many of my warriors are copies of his. Hmmm. HSA, CLP, Torch, those nice 3-line bombers, that Retinax Silk-impish thing I never worked out... quite a range.  
  
This round is about winning. Obvious really, so perhaps its better to say what it is not about: it is not about the winning margin. A defensive warrior that rarely wins but never loses may not be great on the hill, but would be ideal here. Shame I've never written a Silk Imp.  
  
The first choice is P-space or Q2+defensive warrior. He could field a strong Silk/Imp or Stone/Imp and his redundant QS idea was neat, but he knows I can copy it. However, most of the top of Koenigstuhl is P-Spaced, and I think its 65:35 he will go this way.  
  
I don't think he can call my move any better than I can call his, so he will probably include a component that can beat Q2+defensive often enough to stand a chance if I go that route. Of course, he may feel that a 65% chance of winning is high enough. I would, so maybe I ignore the Q2 option... but no need to decide yet. Three Musketeers is my only decent P-spacer. I'll have to check what was in it, though I don't intend to use it. I'm sure Paul will test thoroughly against it and I want to avoid re-using the components if possible.  
  
Enough empty theory. Time to dust off MTS and see how the top of Koenigstuhl stack up... not forgetting Alladin's cave, Alladin's ring, Stalker,... and I'll throw in Phantasm 50 just for luck :-)  
  
Day 2  
  
Paul's P-spacers seem to have several slow-booting components; 10-word launcher and 10-word warrior. I wonder if a Q^2 would be fast enough to catch them? First bombs arrive after 5-20 cycles, 50% of the time and I would expect 10% to be disabling hits... so 5% wins from QS kills? How many times would a launched scanner beat a Silk Imp?  
  
I've never written a Silk/Imp or Stone/Imp, so he has no particular guide to what I might do. OTOH I'm sure he knows my general approach: copy the best I can find. Like me, he will test against the top of Koenigstuhl.  
  
I have a potential trick for a P-spacer, which is to impersonate a QS and play mainly defensive warriors, with rare appearances of a dwarf or a scanner. Sequence of wins and losses would be hard to distinguish from that from a QS, and hard to exploit, but will give a steady trickle of wins.  
  
All I have to do now is persuade MTS to work under W98, or else find a DOS boot disk.  
  
Day 3  
  
P^3 is great! I had no idea if offered such a gain in functionality, and it halves brain length as well. Wonderful... and I don't think published warriors are close to exploring its potential.  
  
However, the big news is that my guess at the balance of power was way off; P-spacers tend to have trouble beating very defensive warriors like Jedimp, or even "normal" imp stones, and most QS will outpoint most P-spacers. I've tried 11 QS against 23 PS -- all the obvious ones, plus a few Kline specials -- and the MTS results are very clear. Snoopy and Harquebus can handle some defensive warriors but none of the other P-spacers do well. Snoopy has a lovely trick; the paper splits just fast enough to beat a DAT bomber, but spends most of its time in anti-imp strip bombing. Great against Stone/Imps, ok against Silk/Imps, pathetic against scissors but as a P-component who cares? I will have to check how Harquebus works, I thought it was just a conventional scanner.  
  
I have a few ideas about Silk/Imps (you can't stare at Jedimp that long and not have:) so I can write a novel defensive warrior to partner a QS.  
  
To do:  
1) Find out why Jade, Recovery and nPaper have particularly effective QS, and copy.  
2) Steal an appropriate defensive in case I can't write something better. Jedimp would be appropriate.  
3) Check out that Silk Imp...  
  
  
Postscript  
  
Time got short towards the end of development, so I stopped making notes at the time, and my memory is a little hazy. I liked the Jade QS (very compact, so effective against other QS) and the ROTF paper which gave almost every P-spacer indigestion; only Pattel's virus beat it decisively.  
  
With a fallback warrior in place, I set to work on a p^3 containing ROTF, nPaper II, those deadly scissors from Pattel's Virus and a booted stone/imp. P^3s give you total freedom for the state engine, and I used it to pop up the scanner or stone occasionally if the paper's were tieing, but leave the papers on if they had won more than they had lost. The result is All In, which is currently being bounced around the bottom of the 94 hill -- as befits such an unaggressive warrior. Lack of aggression is no problem in a knockout competition, but even it these terms it could never quite match the Jade/ROTF combination against the kind of opposition I expected... so in it went the fallback.  
  
In the event this proved to be a good decision, because RotF Copy beats most of the other entrants, drawing only with Quicksilver and Self-Modifying Code. Against Paul the Wimp proved invaluable; without it the scores are close but Paul's warrior has a slight edge.  
  
  

Final Warrior

;redcode-94 test
;name RotF Copy
;author Robert Macrae 
;strategy q^4 -> silkish/imp after David Moore / Ben Ford 
;assert (CORESIZE==8000)

; Endless agonising, and I came back to the first version. Oh well, at
; least I learned to code a P^3, though it never quite beat this 8-/


iHOP	equ	(2667)
iINC	equ	(-iHOP-1)
iORG	equ	(spin+630)
iOFF	equ	(iORG+iINC)

qf	equ	qptr
qs1	equ	(-120)
qs2	equ	(-240)
qd	equ	4000
qi	equ	7
qr	equ	13
qo	equ	(qi*qr-(qi/2))


wimp  jmp   #0,         #0
 
    for 10
      dat 0,0
    rof

	dat	#  15,	#  10	; A, D
qtab	dat	#   7,	#   4	; B, E
	dat	#  13,	#  11	; C, F
qbmb	dat	<   1,	<  qo
qinc	dat	#  qd,	#  qd

qfas	mul.f	 qtab,	 qptr	; decode
qfnd	sne	*qptr,	@qptr
	add	 qinc,	 qptr
	sne	>3456,	@qptr
	mov.x	 qptr,	 qptr
qloo	mov	 qbmb,	@qptr	; .5c negative bomber
qptr	mov	< qs2,	@ qs1
	sub.x	#  qi,	 qptr
	djn	 qloo,	#  qr
	jmp	 boot,	>1234

qscan	sne	qf+ 1*qs2,	qf+ 1*qs1
	seq	qf+ 1*qs2+qd,	qf+ 1*qs1+qd	; 1, 1
	jmp	qfnd,	{qf+ 1*qs2+qd+qi
	sne	qf+ 8*qs2,	qf+ 4*qs1
	seq	qf+ 8*qs2+qd,	qf+ 4*qs1+qd	; B+1, E
	jmp	qfas,	}qtab
	sne	qf+ 7*qs2,	qf+ 5*qs1
	seq	qf+ 7*qs2+qd,	qf+ 5*qs1+qd	; B, E+1
	jmp	qfas,	>qtab
	sne	qf+ 6*qs2,	qf+ 3*qs1
	seq	qf+ 6*qs2+qd,	qf+ 3*qs1+qd	; B-1, E-1
	djn.f	qfas,	qtab
	sne	qf+13*qs2,	qf+11*qs1
	seq	qf+13*qs2+qd,	qf+11*qs1+qd	; C, F
	jmp	qfas,	}qfas
	sne	qf+15*qs2,	qf+10*qs1
	seq	qf+15*qs2+qd,	qf+10*qs1+qd	; A, D
	jmp	qfas,	{qfas
	sne	qf+14*qs2,	qf+ 9*qs1
	seq	qf+14*qs2+qd,	qf+ 9*qs1+qd	; A-1, D-1
	djn.f	qfas,	{qfas
      jmp   boot

    for 25
      dat 0,0
    rof

d2    equ 1143
TSTEP equ 1751
bstep equ 1819 ;2283 ;1997
bootto equ 1700-(80+15)*4-1

boot    spl     wimp,   }-500          

;-------------------------
; Silk with Imps from ROTF
;-------------------------

impy equ 2667
aaa  equ 1880
bbb  equ 2050
ccc  equ  240

        spl 1, >-600
table2  spl 1, >-700
        spl 1, >-800
        mov <1, {1
        spl ccc+paper+8, paper+8

paper   spl  @0, >aaa
        mov }-1, >-1
        spl  @0, >bbb
        mov }-1, >-1
        spl  @0, <2668
        mov }-1, >-1
        mov.i #2*aaa, }-aaa
        mov.i #bbb, impy


        end	    qscan

All content on this and all other KOTH.org web pages is copyright KOTH.org, 1995-2025. All rights reserved.