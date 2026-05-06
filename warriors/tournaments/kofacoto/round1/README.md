# KOFACOTO Round 1: White Warrior

Reference: [KOFACOTO home page](http://www.koth.org/kofacoto/) | [Results](http://www.koth.org/kofacoto/results1.html) | [Warriors](http://www.koth.org/kofacoto/warriors/round1) | [Comments](http://www.koth.org/kofacoto/comments1.html)

## Rules

Entries were due Sunday, October 8th 2000, midnight CST.

At the bottom you will see the previously unpublished code of Return Of The Jedimp. I -believe- this is the version that at one time lasted quite a while on the Pizza '94 Hill, but I can't be exactly certain.

If you look carefully at the imp spiral creation you'll see it uses a method that's never been independently developed by anyone else as far as I know. The imp spiral evolves over several generations of ring creation. It's really quite interesting.

I have a feeling that something along the lines of He Scans Alone is the best bet for victory, but don't let that sway your development. :)

For the code to He Scans Alone see http://www.KOTH.org/planar/index.html

I'll run 200+ rounds with each person's entry to get their score for this round.

Standard '94 rules: `pmars -r 200 -d 100 -c 80000 -p 8000 -l 100`

Remember overall scores in the opening rounds will determine your seed in the playoffs.

And now the white warrior... enjoy!

### Return Of The Jedimp
-jkw

```redcode
;redcode-94
;name Return Of The Jedimp
;kill Return Of The Jedimp
;author John K W
;strategy Return Of The Jedimp with Q^2 scan...
;strategy v.q4 - altered engine.  new qscan.
;strategy v.q52 - fixed spacing and qscan better
;assert 1

org start

step equ 12             ; gap between qbombs
strafelen equ 4         ; coverage area = step*strafelen*3

bomb    dat <1, step
qstep	dat -step, 2*step

;*************** QSCAN

qs    equ   10

QS1   equ   (100)
QS2   equ   (3*QS1)
QS3   equ   (6*QS2)
QBASE equ   (tab+300)

SIG01 equ   a01
SIG02 equ   {a01
SIG03 equ   }a01
SIG04 equ   >a01
SIG05 equ   <a01
SIG06 equ   a01

start   seq     QBASE+QS2*0+QS1*0, QBASE +QS2*0 +QS1*0+QS3
        jmp     aaa,  SIG01
        seq     QBASE+QS2*1+QS1*0, QBASE +QS2*1 +QS1*0+QS3
        jmp     a01,  SIG02
        seq     QBASE+QS2*2+QS1*0, QBASE +QS2*2 +QS1*0+QS3
        jmp     a01,  SIG03
        seq     QBASE+QS2*3+QS1*0, QBASE +QS2*3 +QS1*0+QS3
        jmp     aaa,  SIG04
        seq     QBASE+QS2*4+QS1*0, QBASE +QS2*4 +QS1*0+QS3
        jmp     aaa,  SIG05
        seq     QBASE+QS2*5+QS1*0, QBASE +QS2*5 +QS1*0+QS3
        djn.f   a01,  SIG06

        seq     QBASE+QS2*0+QS1*1, QBASE +QS2*0+QS1*1+QS3
        jmp     a02,  SIG01
        seq     QBASE+QS2*1+QS1*1, QBASE +QS2*1+QS1*1+QS3
        jmp     a02,  SIG02
        seq     QBASE+QS2*2+QS1*1, QBASE +QS2*2+QS1*1+QS3
        jmp     a02,  SIG03
        seq     QBASE+QS2*3+QS1*1, QBASE +QS2*3+QS1*1+QS3
        jmp     a02,  SIG04
        seq     QBASE+QS2*4+QS1*1, QBASE +QS2*4+QS1*1+QS3
        jmp     a02,  SIG05
        seq     QBASE+QS2*5+QS1*1, QBASE +QS2*5+QS1*1+QS3
        djn.f   a02,  SIG06

        seq     QBASE+QS2*0+QS1*2, QBASE+QS2*0+QS1*2+QS3
        jmp     a03,  SIG01
        seq     QBASE+QS2*1+QS1*2, QBASE+QS2*1+QS1*2+QS3
        jmp     a03,  SIG02
        seq     QBASE+QS2*2+QS1*2, QBASE+QS2*2+QS1*2+QS3
        jmp     a03,  SIG03
        seq     QBASE+QS2*3+QS1*2, QBASE+QS2*3+QS1*2+QS3
        jmp     a03,  SIG04
        seq     QBASE+QS2*4+QS1*2, QBASE+QS2*4+QS1*2+QS3
        jmp     a03,  SIG05
        seq     QBASE+QS2*5+QS1*2, QBASE+QS2*5+QS1*2+QS3
        djn.f   a03,  SIG06

        jmp     evopac          ;nothing found

        dat     1*QS2,  4*QS2+QBASE-ptr
tab     dat     0*QS2,  0*QS2+QBASE-ptr
        dat     2*QS2,  3*QS2+QBASE-ptr

a03     add     #QS1,   @a01
a02     add     #QS1,   @a01
a01     add.ab  tab,    tab
aaa     mov.ba  @a01,   ptr

        sne     DEAD,   *ptr  ;which of the two?
        add.a	#QS3,   ptr

	add.ab	ptr,	ptr

qbrun   mov 	bomb, 	@ptr
	mov 	bomb, 	*ptr
ptr     mov 	-0, 	@step
	add.f	qstep, 	-1
        djn     qbrun,  #strafelen
	jmp	evopac

;*************** EVOPAC

DEAD
ded for 32
dat 0, 0
rof

d2    equ 1143
TSTEP equ 1751
bstep equ 1819 ;2283 ;1997
boot  equ 1700-(80+15)*4-1

evopac  spl     1
        spl     1
        spl     1
        mov     <1,     {1
        jmp     boot,   imp2+1
evol:   spl     @evol,  }TSTEP
        mov.i   }evol,  >evol
evoli:  spl     #d2,    bstep-1
        mov     b,      >2
        add.f   evoli,  j
j:      jmp.f   imp2-d2*8, {-6+bstep
b       dat     <1,     1
imp2    mov.i   #d2,    *0
```

## Results

Janeczek barely edges out the competition in Round 1 with an outstanding warrior scoring over 95% wins! The top 4 entries were pretty much in a statistical dead heat... But I was amazed at the wide diversity of scores, and differing strategies.

| Rank | Name | Wins | Losses | Ties | Score | Normalized |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | janeczek | 1904 | 85 | 11 | 5723 | 1000 |
| 2 | Macrae | 1884 | 103 | 13 | 5665 | 989 |
| 3 | paulsson | 1860 | 128 | 12 | 5592 | 977 |
| 4 | moore | 1833 | 123 | 44 | 5543 | 968 |
| 5 | kline | 1744 | 206 | 50 | 5282 | 922 |
| 6 | pihlaja | 1678 | 233 | 89 | 5123 | 895 |
| 7 | Gunnell | 1400 | 478 | 122 | 4322 | 755 |
| 8 | Liporati | 1362 | 557 | 81 | 4167 | 728 |
| 9 | Schmidt | 1352 | 557 | 91 | 4147 | 724 |
| 10 | Guenzel | 1333 | 581 | 86 | 4085 | 713 |
| 11 | Karonen | 1243 | 639 | 118 | 3847 | 672 |
| 12 | stefan | 1149 | 565 | 286 | 3733 | 652 |
| 13 | Ford | 1124 | 643 | 233 | 3605 | 629 |
| 14 | Chakrabarti | 1048 | 809 | 143 | 3287 | 574 |
| 15 | Yeager | 1016 | 814 | 170 | 3218 | 562 |
| 16 | Khuong | 957 | 833 | 210 | 3081 | 538 |
| 17 | Kacza | 12 | 46 | 1942 | 1978 | 345 |
| 18 | Hillis | 2 | 46 | 1952 | 1958 | 342 |
| 19 | chin | 0 | 1209 | 791 | 791 | 138 |
| 20 | Adamowski | 6 | 1544 | 450 | 468 | 81 |
| 21 | Ankerl | 28 | 1882 | 90 | 174 | 30 |

## Comments

The top 6 warriors from Round 1 all use a precision scanning technique, and I thought that corewarriors who are not familiar with it might like a short introduction.

A precision scan finds the long QS code, then scans for the beginning (or end) of it so that the black warrior knows *exactly* where to find all the components of the white. This makes it pretty easy to boot a cleanup warrior somewhere safe and pick them off at leisure; you can even kill a replicator with DAT bombs when you know exactly where to hit.

I first met it a couple of tournaments ago when Paul Kline used it to win a white warrior round by a landslide. Most long white warriors are best dealt with this way. I have often used in in White warrior rounds, and my multiwarrior `:-=` used a similar "precision fang" approach to get on to the multiwarrior hill by exploiting a single known opponent.

### Strategy Comments

**Force feedback** (Macrae) uses a 0.5c scanner. I am a little surprised that it beat Darkside because the longer the scan takes, the more time the replicator has to overwrite the black warrior. OTOH it is shorter, which makes it less vulnerable to both the QS and the replicators, and it looks as if it comes out a little ahead on balance. If you have not seen a decoy generator before, watch it in cdb. The QS spacing makes -300 a very effective place to put a decoy because the QS will usually scan it 1 cycle before it would have found your real warrior.

**Darkside** (janeczek) uses a 0.8c scan to find the QS faster, but it is longer and so more vulnerable. It is also a bit difficult to reset the pointers if I happen to scan a replicator before I get the QS and so the scan pattern is not always perfect. I discovered that short DAT carpets would kill the replicators very quickly, so I did not bother to bother to boot the bomber but maybe this was a mistake.

**JedimPURGE** (paulsson) is a 0.8c scan coupled with a short 2c QS -- more for fun than effect, I suspect! It SPL carpets the replicators before starting a spiral clear. This requires greater length, but the spiral clear can win even if the scan has missed the QS and found a replicator.

**myBlack** (moore) is different, because the QS is handled by precision spacing of the components; the warrior will often be hit but because the bombs are known to be exactly 12 apart, the components are arranged so that one scanner and payload will (always?) remain intact. This is another neat example of the kind of power that perfect knowledge of your opponent gives you. The warrior is otherwise very similar with a 0.5c scan booting a spiral clear.

**Tsetse** (kline) takes the usual approach, but performs rather worse than the first three. I think this is because it uses a short but slow decoy generator which gives the QS too many chances to hit before the decoy is in place. This is an odd decision because AFAIK Paul invented the 3c decoy generator. It is safe to use a long decoy generator because even if it is spotted by the QS the bombs start to fall on it after it has finished running, and don't reach back to the main warrior. However, the resulting warrior is very compact.

**Jedi Hunter** (pihlaja) follows a 0.5c scan with a scan for the end of the QS. However, unlike all the others that use a 1.0c linear scan, it uses a longer-but-faster stepped scanner. I suspect that this is not a very effective use of space, and that it would have been better to use the space to raise the initial scan to 0.8c, or simply to shorten the warrior. The attack is a SPL/JMP bomber, which again is a bit bulky compared to the other kinds of attack. Finally, the biggest problem is that there is no decoy at all! The warrior is long, so it suffers many hits from the QS and, unlike myBlack, it is not very resistant to DAT bombs.

For comparison to the precision scans, **Hyperclear** (Gunnell) achieves excellent results for a general-purpose warrior but the gap between it and the precision scans is huge; it score is about 75% of Force Feedback, compared to 90-99% for the other precision scans. In some ways grey warriors (in which the constants are unknown) are a richer challenge because you have to write something that resembles a normal warrior rather than just rehashing the precision scan theme. If the boot and replicator steps were not known then something like Hyperclear would probably be the best approach.

### Conclusions

- Precision scan is the best way to handle any long white warrior.
- White Quickscans are almost ineffective.
- Decoy generators are great because the decoy is always ideally placed.
- Cleanup is easy once all the components have been found.

-- Robert Macrae

## Notes

- The tournament page notes that 21 entries were submitted.
- The source page links a comments page for this round.
