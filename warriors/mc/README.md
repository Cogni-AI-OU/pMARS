# Neo's World of Corewar - Mini Challenges

This directory contains warriors and solutions for the Mini Challenges originally hosted at [Neo's World of Corewar](http://labarga.atspace.com/mc.html) by Germán Labarga (Neogryzor).

The challenges were designed to improve redcoding skills through small, specific problems.

## Challenges

### [Mini Challenge #1: "Kick the gate"](http://labarga.atspace.com/mc1.html)
**Goal:** Write an Imp which scores perfectly (100% wins) against this 3-line imp-gate:
```redcode
GATE: JMP #0,<-100
```
* **Local files:** [mc1/](mc1/)

### [Mini Challenge #2: "Lethal jump"](http://labarga.atspace.com/mc2.html)
**Goal:** 
1. Write a warrior which scores 100% TIES against this bomber using only the `JMZ` instruction:
```redcode
G EQU INIT-1
INIT: SPL 0,<G
      MOV 1,<G
END INIT
```
2. The same as Part 1 but scoring 100% WINS.
* **Local files:** [mc2/](mc2/)

### [Mini Challenge #3: "Lucky shot"](http://labarga.atspace.com/mc3.html)
**Goal:** Kill an imp spiral dropping only one bomb. No other attacks allowed. No `SPL` allowed. Minimum 99% wins.
```redcode
ISTEP EQU 2667
IMP:   MOV.I #0,ISTEP
LAUNCH:SPL 1
       SPL 1
       SPL 1
       SPL 2
SPREAD:JMP IMP
       ADD.A #ISTEP,SPREAD
END LAUNCH
```
* **Local files:** [mc3/](mc3/)

### [Mini Challenge #4: "The nuthouse"](http://labarga.atspace.com/mc4.html)
**Goal:** Score as many three-way-ties as possible against a frenzy oneshot and a suicidal bomber. `MINDISTANCE=2000`.
* **Local files:** [mc4/](mc4/)

### [Mini Challenge #5: "Feels like a HP"](http://labarga.atspace.com/mc5.html)
**Goal:** Create a routine which calculates the N-th derivative of a given equation of the form: $A_0 + A_1x + A_2x^2 + A_3x^3 + ... = 0$
* **Local files:** [mc5/](mc5/)

### [Mini Challenge #6: "The smart redcoder"](http://labarga.atspace.com/mc6.html)
**Goal:** Create a p-warrior (p-space brain) for a round-robin competition using three given strategies (Imp, Core clear, Imp-gate) that follow a rock-paper-scissors pattern.
* **Local files:** [mc6/](mc6/)

### [Mini Challenge #7: "Harmless overrun"](http://labarga.atspace.com/mc7.html)
**Goal:** Write an imp that can pass through a wimp (imp gate) while allowing the gate's process to survive. Smallest code and fewest processes wins.
* **Local files:** [mc7/](mc7/)

---
*Source: [Neo's World of Corewar](http://labarga.atspace.com/mc.html)*
