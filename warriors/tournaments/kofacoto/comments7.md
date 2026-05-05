Corewars - King of the Hill    

[![](../pics/button-index-off.jpg)](../README.md) [![](../pics/button-koth-off.jpg)](../koth.md) [![](../pics/button-info-off.jpg)](../info.md) [![](../pics/button-links-off.jpg)](../links.md) [![](../pics/button-newsgroup-off.jpg)](../newsgroup.md) [![](../pics/button-feedback-off.jpg)](../feedback.md)

[![kofacoto!](http://www.KOTH.org/kofacoto/kofacoto.jpg)](http://www.KOTH.org/kofacoto)

  

**Round 7, Comments by Robert Macrae**

  
Astounding -- I made it.  
  
Since David didn't enter a Silk/Imp, maybe they are harder to write than I thought... or maybe he thought I had had too much practice against Jedimp.  
  
I went to a very dull conference yesterday, but I learned something. During several hours of drivel I took a look at Jedimp. Now I know why the Jedimp launchers are so effective, and possibly how to improve them. Look out you aggressive P-spacers, draws are coming back into fashion!  
  
On to the final.  
  
I don't know anything about this guy except that he keeps winning things. I'll have to see what Dejanews shows, and take a look at his earlier entries, but I doubt it will teach me much; at best I will learn whether he specializes in writing new things or, like me, in selection and tweaking. Either way he will pick a strong warrior. All I can do is pick something that beats as many as possible of his plausible choices.  
  
I need to remind myself of the universe.  
  
No Silks, so Vamps are good. I quite fancy an Incendiary (Paul kindly explained how to write one, once, with bombs like MOV 5, <5 / SPL 0, 0) though I'm not sure I have time to do it from scratch. Kitchen Sink copied a neat multicomponent idea of David's, selecting elements one after another in the '88 equivalent of a P-Spacer. Of course he knows I wrote that, and will test against it.  
  
Or maybe I could adapt my heavy imp-launcher idea to '88. It should take a fast bomber or a spiral clear to crack it. A stone/imp is starting to sound good.  
  
Day -1  
  
A survey of the top 25 warriors makes the choice quite clear: choose one of Davids. Freight Train is a very compact, effective stone with strong imps and a decent clear. Idle thoughts of building an incendiary generate some excitement, but never look like matching FT. So, how about a replicator? Nightfall looks possible. Or Tangle Trap, which can just about beat FT due to FTs multiple elements. Or, what else?  
  
At first sight a scanner looks like a mad choice, and will be massacred by FT, but it would beat Nightfall it is a possibility. Make it a oneshot, maybe switching between a bombdodger and clear depending on what it finds. However, the switcher is a bit bulky, and it is hard to write a clear that can handle FT and NF, even sitting on one of FT's bombs. Leapfrog, Kitchen Sink and similar don't look very suitable; too bulky, too fulnerable to vampires, and too weak to kill FT. An S/D clear is fine against NF, but otherwise useless.  
  
All in all the alternatives don't look great, so I'm down to a choice: FT, TT or NF...  
  
Day 0 and counting...  
  
But that isn't easy. QS + NF? It will only fall to a scanner, but NF can't kill imps. Can I tweak it? Adding an imp, or FT, or a clear just seems to slow NF down and give away wins to TT and even FT. Disappointing.  
  
Tweak FT? I could certainly adjust the step as a precaution, but I don't expect to add any power.  
  
FT is a very good candidate exactly as it stands, and since NF seems to beat TT I think it comes down to FT or NF+QS. But which?  
  
[Lots of fruitless tweaking]  
  
Hour -2, and very late at night.  
  
I have a version of NF that can sometimes kill imps. It is weaker, but not enough to matter against a vampire, or a scanner which will win against either. So... it ties some variants of FT and beats most other options... it should come down to a QS shootout if he plays FT or NF, a lose if he scans or a win against anything else. Good enough, and time for bed.  
  
Though I wish I could shake the feeling that, if I face an FT variant, it is likely to be _stronger_ than FT against NF...  
  
  
Postscript  
  
Actually, "Late At Night" wasn't quite the final version. Something was bugging me, and at 3am I took just one final last tiny look at the Quickscan, and found that it was missing 7% of its attacks and had the bombing pattern out of line. Fixing this gives "Later At Night" and moves it from tieing FT to winning...  
  
  
Result  
  
Very close. In effect the QS has to hit a length 3 target to get a kill; 3 x 28 / 8000 ~ 1.2% which gives 12 kills in 1000 rounds, close to the result. Note that a scanner would kill both warriors easily.  
  
  
Final Warrior  

;redcode
;name LaterAtNight
;author Robert Macrae
;strategy Nightfall + QS
;assert CORESIZE==8000


; ---------------------------------------------------- 

; QS from Kitchen Sink

; Adjusts QS parameters

qint equ (-120)
dist equ (1388-400)
incr equ -1001
time equ 920
front equ (found4-2)
qbs  equ 7
qbn  equ 7

found4  add # qint*4, qptr
found2  add # qint*2, @-1
found1  add # qint*1, @-2
found0

qbite   cmp @qptr, front
         add #4100, qptr
        add #3900, qptr                  

qmain   mov db,    @qptr
qptr    mov db,    @(qscan + 2*qint)
        sub #qbs,  qptr
        djn qmain, #qbn
qpit    jmp boot, 15

db      dat <1,    <qbs*qbn - (qbs/2)

; ---------------------------------------------------- 

qscan   cmp qscan +  2*qint, 3900 + qscan +  2*qint
         jmp  found0, 0
        cmp qscan +  3*qint, 3900 + qscan +  3*qint
         jmp  found1, 0
        cmp qscan +  4*qint, 3900 + qscan +  4*qint
         jmp  found2, <found1
        cmp qscan +  5*qint, 3900 + qscan +  5*qint
         jmp  found2, 0
        cmp qscan +  7*qint, 3900 + qscan +  7*qint
         jmp  found4, <found2
        cmp qscan +  8*qint, 3900 + qscan +  8*qint
         jmp  found4, <found1
        cmp qscan +  9*qint, 3900 + qscan +  9*qint
         jmp  found4, 0

        mov #(qscan + 10*qint) -qptr, qptr

        cmp qscan +  10*qint, 3900 + qscan +  10*qint
         jmp  found0, 0
        cmp qscan +  11*qint, 3900 + qscan +  11*qint
         jmp  found1, 0
        cmp qscan +  12*qint, 3900 + qscan +  12*qint
         jmp  found2, <found1
        cmp qscan +  13*qint, 3900 + qscan +  13*qint
         jmp  found2, 0
        cmp qscan +  15*qint, 3900 + qscan +  15*qint
         jmp  found4, <found2
        cmp qscan +  16*qint, 3900 + qscan +  16*qint
         jmp  found4, <found1
        cmp qscan +  17*qint, 3900 + qscan +  17*qint
         jmp  found4, 0

; ---------------------------------------------------- 

aaa equ 2917
bbb equ 2030
ccc equ 6842 

length equ 9

boot   spl 2,0
       spl 2,paper+length+aaa
       spl 1,paper+length
       mov -1, 0           ; 9 proc


       mov <-2, <-3        ; must boot one copy in advance for silk

paper  spl aaa, length+(aaa*2)
       mov <paper+length+aaa, <paper

       mov <length, <1     ; use empty core as pointer to self
       spl      @0,  bbb

inner  mov <length, <1
       spl      @0,  ccc

       mov       3,  <inner-2           ; Bomb!

       mov      #0,  inner+length
       jmp   inner, <inner+1


end qscan

All content on this and all other KOTH.org web pages is copyright KOTH.org, 1995-2025. All rights reserved.