Corewars - King of the Hill    

[![](../pics/button-index-off.jpg)](../README.md) [![](../pics/button-koth-off.jpg)](../koth.md) [![](../pics/button-info-off.jpg)](../info.md) [![](../pics/button-links-off.jpg)](../links.md) [![](../pics/button-newsgroup-off.jpg)](../newsgroup.md) [![](../pics/button-feedback-off.jpg)](../feedback.md)

[![kofacoto!](http://www.KOTH.org/kofacoto/kofacoto.jpg)](http://www.KOTH.org/kofacoto)

  

**Round 6, Comments by Robert Macrae**

  
Hey, I made it! The Wimp (as recommended by Kline) seems to have done the trick though I guess RotF might have pulled through; it is pretty scanner-resistant and should get an occasional easy round against the DClear. To check, if I have time...  
  
Enough celebration, back to work.  
  
Day 1.  
  
Hi David.  
  
Someone else I know, though I am now the official old timer. I think we last squared off in '88, with very decisive results. 94x is much more to my taste, but I doubt BigBoy is up to the pace any more :-/  
  
[Perhaps I could just rustle up a Netrek tournament to keep him busy?]  
  
Hmmm. He has created whole new groups of warriors. I haven't (bar BigBoy's obsolete handshaking) so I'm just going to rely on my staple Kline/Moore retreads. I guess I'd better change the step sizes on ROTF this time 8-)  
  
P^3 is compulsory since QS don't work well in large core. But what to use? I'm going to hold off publishing my comments on Round 5 just in case they give away too much of my approach, because it will be more of the same this time. I'd better get polishing on All In. I wonder what David produced for round 5? I also wonder if he could pull off one of his nasty boot detectors in large core? Sounds tough, but I'd better read Corewarrior...  
  
94x doesn't really change the rules of the game. Core is larger, so the first tens of cycles are less important, but if anything initial scan speed and scan/length matter more. Zoom et al sound good. Since length is less of an issue, a QS could be added to a P-spacer.  
  
I will have to remind myself of the imp numbers.  
  
Again, this is a zero sum game so draws don't matter, only wins and losses. Defensives like Silk/Stone, Silk/Imp, Stone/Imp should be a big part of the picture, with a scanner or two to add spice? Digitalis is nice.  
  
Lots to think about, in the morning...  
  
Day 2-3  
  
How time flies, and not a line of coding. I have a neat idea for a Distributed D-Clear (got to call it D^2 :-) that should beat stone/imps but lose horribly to SPL bombers, or indeed anything else. It could make a P-component.  
  
Papers will have a really tough time killing imps because there are so many potential steps. I could use P-space to store information about the imps, and this would allow communication between replicators, but reading it in a Silk is terribly expensive. This would only work with a 1 or 2 process replicator, and maybe not then. Perhaps a better idea is stepped bombing with MOV 0, <1 and MOV 0,{1, which should occasionally weaken imps enough for a kill?  
  
It looks as if there are 4 viable strategies. Stone/Imp, Silk/Imp, D^2 and Scanner. D^2 and Scanner will give away if they are ever played against the wrong opponent, so there is a strong case for optimising the first two components, and if possible leaving out the last two; cowardly, but if the result is a 1-0-199 win to one of us it will be a 50% chance which way it goes, twice the odds I give myself right now! Of course if all components are defensive, a QS would swing the result even if it is rather inneffective. The problem is that I can't rid myself of the expectation that David will conjour up something very deadly against one of my defensives and that having two will merely limit his winning margin.  
  
I would feel safer if I could give my P-engine a credible aggressive option to play if it finds itself behind.  
  
Can I write an Imp-killing Silk? At the moment I guess that St/I just beats Silk/I because Silk almost never gets the imp.  
  
Priority #1 -- write that unkillable Stone/Imp.  
Priority #2 -- learn how to kill it with a Silk.  
Priority #3 -- code up a component to kill whichever of 1 and 2 looks nastiest, and hope that David has followed the same general line.  
Priority #4 -- write the switcher so that #3 is called on only in dire need.  
  
Simple really, but I only have about 8 hours to do it all.  
  
Day 4  
  
How embarrassing. The smallest number of points to an imp is 13, so a 64-point imp has only 5 processes per point. This means it will pass any gate 1.8 times in 500,000 cycles, ie it is dead meat against a decent stone/imp. Even a 256 process imp has only a 50% chance against a gate, so defence is not nearly as strong as I thought. Time for a total, 100%, complete rethink because the Stone vs Stone battles will in fact give lots of wins to both sides. It is still tough for Silks to get that kill, but as Stones are stronger than I though, hence my D^2 idea looks even better. Actually the priorities have not much changed, though the importance of imps and QS has been reduced because the other components can generate kills.  
  
Another thought: I once did some work on how to launch ultraheavy imps. A launcher for 4 x 64 process imps might be only 8 or so long, but it would take several hundred cycles to get the imp up to size. A bigger problem is that it would be a real process-hog, and really slow down any stone. Overall, I don't think it makes sense, so I assume that we are dealing with only light imps.  
  
  
Day 6  
  
Despair, doom and gloom. I can't build a decent Silk/Imp, or anything else that looks remotely unkillable. I have a nice Digitalis-like DClear and 2pt Imp. A 64pt imp is hard for gates or papers to stop, but the warrior is easy meat for scanners. My DClear is about 6 long, +2 vulnerable instructions on the imps, and the clear is only 1c.  
  
Nor do I have a convincing warrior to beat scanners and tie silks. A simple bomber could handle the scanner, but I have to guess I meet silks half the time so I need an imp for draws... and I so far I have not built a short, fast-splitting bomber. I could use BigBoy, but it is really to big to do well against a scanner.  
  
So I need a scanner. Stalker looks lovely, and it will have to do as time is getting very short. It should handle his scanner ok (?) but would it be up to a defensive Silk? It is a pattern scanner, so it does not SPL carpet for long enough to really stun the Silk unless it gets a lucky early hit. Still, no choice now, I still have to write the state machine.  
  
I love P^3s. This one should stabilize on DC or S if it gets a fixed opponent that either can beat. If not, it will move to immediate switch-on-loss, which should do better well any P-switcher except a switch-on-win. After 4 switches, back to the slow-switching code... and all in a dozen words. Lovely.  
  
  
Postscript  
  
This was a close round, in the sense that none of the four warriors has a clear edge. Christian's Silk/Imp is exactly the kind of thing I tried and failed to build, and it had great misfortune to come up against the only opponent that could beat it decisively. Results, had the pairings been different, look like:  
  
  

	    vs	J	Ma	Mo	S
Janeczek	-	W	L	W
Macrae		L	-	W	D
Moore		W	L	-	D
Schmidt		L	D	D	- 

  
So Michal's warrior has a slight edge overall.  
  
Final Warrior

;redcode-94
;name Damage Inflicted
;author Robert Macrae
;assert CORESIZE == 55440
;strategy DClear/Imp, Scanner

; One day I will learn to write a decent Silk. 
; In the meantime, just hope that David has gone for 
; something aggressive...
; sadly, there is little reason for him to do so.

; The idea was to have these aggressive components 
; appearing occasionally from behind a robust silk/imp;
; the combination should have been quite tough to handle.
; However, the SI never materialized so I have to rely
; on David 1) Not playing a strong Silk/Imp, and 
; 2) Not playing a scanner that can beat my 64proc, 2point 
; imp. Most scanners can :-(

; How about a wimpy Silk + Stone/Imp + bomb-dodger, please?


; ----------------------------------------------------
; Stalker for big core

; with overlapping scans, trail will always (?) be detected but 
; here it is after 5800 cycles -- academic, I suspect.


vStep     equ    (266)
vGate     equ    (vPtr-3)
vOffs     equ    (vClr+2-vStep*30-20)

vPtr      mov    }vFlag   ,>6000        ; } resets 5-line scan to 4-line
          mov    vIncr    ,>vPtr
vNext     add    vIncr    ,vScan        ; standard 3-line .66c scan
vScan     sne    vStep    ,vStep+21     ;
vFlag     djn.f  vNext    ,<16616       ; djn-stream - back at last!

vSet      mov.ab vScan    ,vPtr         ; set pointer to begin carpet
          jmn    {vFlag   ,vPtr         ; { turns 3-line scan into 4-line
vIncr     spl    #vStep   ,#vStep
          mov    vClr     ,>vGate       ; dclear to finish
          djn.f  -1       ,>vGate

          dat    0,0                    ; Mod 7 pattern

vClr      dat    >(55440/2)+1    ,2-vGate

    i for 13
        dat 0,0
      rof

vBoot     spl 1, vClr+1
      i for 6
          mov <vBoot, <vBp  ; (up in Imp splits)
        rof 
         djn vOffs-9, #2
             

    i for 14
        dat 0,0
      rof


; ---------
; P^3 Brain

w0      EQU vBoot       ; Stalker
w1      EQU boot       ; D/I   

PSTATE  EQU 1278


think   ldp.a    #0      ,in
        ldp.a    #PSTATE ,table
        mod.ba   *in     ,table
        stp.b    *table  ,#PSTATE

                        ; S  L T W
table   jmp }0   ,0748  ; 00 1 0 8
        dat #w0  ,0210  ; 01 3 1 0  
        dat #w0  ,0662  ; 02 5 2 2  
        dat #w1  ,0949  ; 03 4 3 9  
        dat #w1  ,0213  ; 04 6 4 3  
        dat #w1  ,0225  ; 05 0 5 5
        dat #w0  ,0556  ; 06 7 6 6 
        dat #w1  ,0227  ; 07 2 7 7 
        dat #w0  ,0558  ; 08 0 8 8 
        dat #w1  ,0669  ; 09 3 9 9
        dat #w0  ,0430  ; 10 7 1 0       

in      dat  0,9   ; L must have non-zero b-field in the previous cell
        dat  0,10  ; W
        dat  0,11  ; D


             for 53
		   dat 0,0
             rof


; ----------------------------------------------------

; DClear with 64p 2 point imp. Vulnerable to scanners,
; but good against stone/imps.

half  equ (55440/2)

             for 12
		   dat 0,0
             rof

boot
   i for 6 
      mov    <bp, {bp	
     rof
      mov    ptr,  ptr+half-700
      mov   imp,		imp-200
      mov   imp,		imp-200+half
bp    spl    bomb+1+half-700, bomb+1     
      spl   *bp,        >4000
vBp	spl   1,		vOffs
	spl   1,		>5000
	spl   1,		>6000
	spl   1,		>7000
	spl   1,		>8000
	spl   2,		>9000
 	jmp   imp-200,		}0
 	jmp   imp-200+half,	}0	
imp   mov.i #0,         half+1


             for 18
		   dat 0,0
             rof


ptr             dat >0, 1000

             for 3
		dat 0,0
             rof

dc              spl #0,     }ptr
                spl #0,     }ptr
                mov.i bomb, >ptr
                mov.i bomb, >ptr
                djn.f -1,   >ptr
bomb            dat -500,  bomb-ptr+2

      end   think

All content on this and all other KOTH.org web pages is copyright KOTH.org, 1995-2025. All rights reserved.