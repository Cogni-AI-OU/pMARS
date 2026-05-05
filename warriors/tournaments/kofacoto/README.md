# KOFACOTO

![kofacoto!](http://www.KOTH.org/kofacoto/kofacoto.jpg)

**KOFACOTO is over!**

*   **1st:** Robert Macrae
*   **2nd:** Michal Janeczek
*   **3rd:** David Moore

KOFACOTO was sponsored by [TTSG Internet Services](http://www.ttsg.com)! Thanks to Tuc for making this happen! [TTSG Internet Services](http://www.ttsg.com) awarded prizes of $500 for first, $250 for second, and $100 for third.

Presented by [www.KOTH.org](http://www.KOTH.org), Tuc, and [jkw](mailto:jkw@koth.org).

---

## Tournament Information

### Scoring
The person earning the best winning score received 1000 points in each preliminary round. Everyone else received a score normalized to 1000. For example, if the best program got 500 pts against the white warrior and you got 400 pts, the best one receives 1000 pts and you receive 800.

### Total Scores
*Total scores for each player from the first 4 preliminary rounds.*

| Name | Score |
| :--- | :--- |
| janeczek | 3614 |
| moore | 3256 |
| liporati | 2874 |
| macrae | 2868 |
| p.kline | 2867 |
| schmidt | 2761 |
| paulsson | 2723 |
| ford | 1736 |
| gunnell | 1654 |
| guenzel | 1399 |
| karonen | 1184 |
| stefan | 1094 |
| hillis | 1089 |
| yeager | 1015 |
| pihlaja | 895 |
| nevermind | 630 |
| chakrabarti | 605 |
| adamowski | 553 |
| khuong | 538 |
| metcalf | 478 |
| kacza | 345 |
| ankerl | 227 |
| chin | 184 |

---

## Round 1

### White Warrior: Return Of The Jedimp
The white warrior for Round 1 was **Return Of The Jedimp**. This version uses an imp spiral creation method where the spiral evolves over several generations of ring creation.

**Rules:** Standard '94 rules: `pmars -r 200 -d 100 -c 80000 -p 8000 -l 100`

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

### Results
The round saw 21 entries. Michal Janeczek won with an outstanding warrior scoring over 95% wins! The top 4 entries were in a statistical dead heat, but there was a wide diversity of scores and strategies among the field.

| Name | Wins | Losses | Ties | Score | Normalized Score |
| :--- | :--- | :--- | :--- | :--- | :--- |
| janeczek | 1904 | 85 | 11 | 5723 | 1000 |
| Macrae | 1884 | 103 | 13 | 5665 | 989 |
| paulsson | 1860 | 128 | 12 | 5592 | 977 |
| moore | 1833 | 123 | 44 | 5543 | 968 |
| kline | 1744 | 206 | 50 | 5282 | 922 |
| pihlaja | 1678 | 233 | 89 | 5123 | 895 |
| Gunnell | 1400 | 478 | 122 | 4322 | 755 |
| Liporati | 1362 | 557 | 81 | 4167 | 728 |
| Schmidt | 1352 | 557 | 91 | 4147 | 724 |
| Guenzel | 1333 | 581 | 86 | 4085 | 713 |
| Karonen | 1243 | 639 | 118 | 3847 | 672 |
| stefan | 1149 | 565 | 286 | 3733 | 652 |
| Ford | 1124 | 643 | 233 | 3605 | 629 |
| Chakrabarti | 1048 | 809 | 143 | 3287 | 574 |
| Yeager | 1016 | 814 | 170 | 3218 | 562 |
| Khuong | 957 | 833 | 210 | 3081 | 538 |
| Kacza | 12 | 46 | 1942 | 1978 | 345 |
| Hillis | 2 | 46 | 1952 | 1958 | 342 |
| chin | 0 | 1209 | 791 | 791 | 138 |
| Adamowski | 6 | 1544 | 450 | 468 | 81 |
| Ankerl | 28 | 1882 | 90 | 174 | 30 |

*   [Warriors Round 1](round1/)

### Comments
The top warriors from Round 1 utilized precision scanning techniques to exploit the known white warrior.

**Robert Macrae's Analysis:**

A precision scan finds the long QS code, then scans for the beginning (or end) of it so that the black warrior knows *exactly* where to find all the components of the white. This makes it easy to boot a cleanup warrior somewhere safe and pick them off at leisure.

*Detailed comments:*

**Force Feedback** uses a 0.5c scanner. The QS spacing makes -300 a very effective place to put a decoy because the QS will usually scan it 1 cycle before it would have found your real warrior.

**Darkside** uses a 0.8c scan to find the QS faster, but it is longer and so more vulnerable. It is also a bit difficult to reset the pointers if it scans a replicator before getting the QS.

**JedimPURGE** is a 0.8c scan coupled with a short 2c QS. It SPL carpets the replicators before starting a spiral clear.

**myBlack** handles the QS by precision spacing of the components; the components are arranged so that one scanner and payload will remain intact even when hit.

**Tsetse** uses a short but slow decoy generator. It is generally safe to use a long decoy generator as even if it's spotted, bombs reach it after it's finished.

**Jedi Hunter** uses a stepped scanner and follows with a scan for the end of the QS. Lacking a decoy makes it vulnerable to the QS and DAT bombs.

**Hyperclear** achieved excellent results for a general-purpose warrior, though precision scans significantly outperformed it.

**Conclusions:**
- Precision scan is the best way to handle any long white warrior.
- White Quickscans are almost ineffective.
- Decoy generators are great because the decoy is always ideally placed.
- Cleanup is easy once all the components have been found.

---

## Future Rounds
*   Round 2
*   Round 3
*   Round 4
*   Round 5 (Quarterfinals)
*   Round 6 (Semifinals)
*   Round 7 (Finals)
