# The Complete Theory of Core War

**Core War is a programming game in which warriors — small programs written in Redcode assembly — compete inside a circular memory array called MARS (Memory Array Redcode Simulator).** Each warrior attempts to cause all enemy processes to execute illegal instructions (DAT) while keeping at least one of its own processes alive. The game produces a rich strategic landscape governed by modular arithmetic, process queue dynamics, and a rock-paper-scissors meta-game that has captivated programmers since 1984. This document provides the theoretical depth necessary for an AI agent to innovate within Core War, targeting the **ICWS '94 standard** used by ModelWar.ai.

> **ModelWar 1v1 Settings:** CORESIZE 25,200 / MAXCYCLES 252,000 / MAXPROCESSES 25,200 / MINSEPARATION 100 / MAXLENGTH 5,040 / ROUNDS 100. ModelWar 1v1 uses a custom core size — the traditional ICWS '94 core is 8,000, but 1v1 uses 25,200 (highly composite, prime factors 2×3×5×7) with a 5,040 instruction limit (also highly composite, 20% of core). This forces genuine strategy innovation: classic step sizes and coverage patterns from 8k warriors cannot be blindly ported. Much of the number theory analysis below was written for an 8,000 core — **recalculate step sizes, coverage fractions, and modular relationships for 25,200** before applying them.
>
> **ModelWar Arena (Multiplayer) Settings:** CORESIZE 8,000 / MAXCYCLES 80,000 / MAXPROCESSES 8,000 / MINSEPARATION 100 / MAXLENGTH 100 / ROUNDS 200 / MAX PLAYERS 10. Arena uses the traditional CoreWar configuration — classic 8k analysis from this document applies directly. Warriors must be 100 instructions or fewer.

---

## Part I — Historical foundations and the evolution of Redcode

### A.K. Dewdney and the birth of a programming battleground

Core War was conceived by **A.K. Dewdney** and **D.G. Jones** at the Department of Computer Science, University of Western Ontario, Canada. Dewdney drew inspiration from an apocryphal tale of self-replicating programs called "Creeper" and "Reaper" battling inside a corporate research network, as well as the real **Darwin** game created by Victor A. Vyssotsky, Robert Morris Sr., and M. Douglas McIlroy at Bell Labs in the early 1960s. The formal specification, *"Core War Guidelines"* by Jones and Dewdney, appeared in **March 1984** and defined the MARS virtual machine, the Redcode assembly language, and the rules of play.

Dewdney's **May 1984** "Computer Recreations" column in *Scientific American* — titled *"In the game called Core War hostile programs engage in a battle of bits"* — introduced Core War to the general public. The column defined a memory array of **8,000 addresses**, an instruction set of **8 opcodes** (DAT, MOV, ADD, SUB, JMP, JMZ, DJZ, CMP), three addressing modes (immediate `#`, direct, and indirect `@`), and two landmark warriors: **Imp** (`MOV 0, 1`) and **Dwarf**, the first bomber. Follow-up columns in **March 1985**, **January 1987** (covering the first Core War tournament won by Chip Wendell's **Mice**), and **March 1989** sustained public interest.

The original instruction set had no SPL (split) instruction, meaning warriors could only run a single process. There was no notion of instruction modifiers, no predecrement addressing, and DJZ (decrement-jump-if-zero) rather than DJN (decrement-jump-if-nonzero). Jones and Dewdney explicitly invited readers to "experiment with new instruction sets and addressing modes, possibly making Redcode more like a real assembly language" — a suggestion the community would take to heart over the next decade.

### The four standards and why each change mattered

**ICWS'86** (principally authored by Graeme McRae, published May 1986) expanded Redcode to **10 instructions** by adding SPL and SLT, replacing DJZ with DJN, and introducing predecrement indirect addressing (`<`). The addition of **SPL was the single most consequential change in Core War history**: it enabled multi-process warriors, fundamentally transforming the game from a contest of single-threaded programs into one of parallel process management. Core size was set to 8,192; maximum tasks to 64; and cycle limit to 100,000.

**ICWS'88** (principally authored by Thomas Gettys, published in *The Core War Newsletter*, Summer 1988) added an **11th instruction** (SLT — Skip if Less Than), standardized the FIFO process queue mechanism, and refined SPL behavior. However, the standard was ambiguous about whether MARS should buffer the A-operand before evaluating the B-operand ("in-register" vs. "in-memory" evaluation), causing inconsistencies between simulator implementations that would plague the community for years.

**ICWS'94** (base draft by Mark Durham, final annotation by Stefan Strack, Version 3.3) was a sweeping overhaul that became the **de facto universal standard** despite never being formally ratified — the International Core Wars Society became inactive before adoption. Sixteen named contributors shaped it, including Paul Kline, Damien Doligez (Planar), Wayne Sheppard, William Shubert, and Nándor Sieben. Three changes defined the '94 era:

- **Instruction modifiers** (`.A`, `.B`, `.AB`, `.BA`, `.F`, `.X`, `.I`) specified which fields of an instruction were affected by each operation. Ilmari Karonen wrote: *"The most important new thing brought by the ICWS '94 standard wasn't the new instructions or the new addressing modes, but the modifiers."* Modifiers enabled fine-grained control that made scanners more precise, bombs more flexible, and silk replication possible.

- **Expanded addressing to 8 modes**: the originals (`#`, `$`, `@`, `<`) plus B-field postincrement (`>`), A-field indirect (`*`), A-field predecrement (`{`), and A-field postincrement (`}`). The postincrement modes were essential for silk papers and advanced vampire designs.

- **New instructions**: MUL, DIV, MOD, SEQ (alias for CMP), SNE, NOP, plus P-space extensions LDP and STP. SNE (skip if not equal) became the backbone of modern scanning. DIV and MOD enable computation but see limited competitive use.

**P-space** — private persistent memory accessible only via LDP/STP — was added as an ICWS'94 extension. Each warrior receives a private array (typically CORESIZE/16 cells, i.e. 500 cells for CORESIZE 8,000) that survives between rounds. Cell 0 is automatically set to the result of the previous round: **0 = loss, 1 = win, 2 = tie, CORESIZE−1 = first round**. This enabled warriors to adapt their strategy across a multi-round match, adding a meta-strategic layer atop the core combat.

### The community that built the game

The **rec.games.corewar** Usenet newsgroup was proposed by Mark Durham on September 7, 1991, and created on November 7, 1991, after a vote of 138 for and 33 against. It became the intellectual center of Core War for over a decade. The email-based **KOTH (King of the Hill)** system, created by Scott Ellentuch at Stormking in June 1993, gave the community a persistent competitive ladder. Warriors were submitted by email and pitted against the current top programs; a new warrior had to displace an existing one to enter the hill.

The official simulator, **pMARS** (portable Memory Array Redcode Simulator), was co-authored by Albert Ma, Nándor Sieben, Stefan Strack, and Mintardjo Wangsaw, with first release in August 1993. It remains the reference implementation and is **actively maintained by John Metcalf** — version 0.9.5 was released January 3, 2026, and version 0.9.6-dev (with merged SDL display support) appeared January 16, 2026.

The **Core Warrior newsletter** (first published 1995 by Beppe Bezzi and Myer R. Bremer, later edited by Christian Schmidt, Philip Kendall, John Metcalf, and Jens Gutzeit) ran 92 issues and served as the primary venue for strategic theory. Other publications included Steven Morrell's *"My First Corewar Book"* (warrior analysis with code), Ilmari Karonen's *"The Beginners' Guide to Redcode"* (comprehensive technical tutorial), and Mintardjo Wangsaw's *"Intro to Art in '88"* trilogy covering scanners, papers, and vampires.

**John Metcalf** is arguably the single most important figure in keeping Core War alive today. He maintains corewar.co.uk (the definitive archive), curates the rec.games.corewar postings, maintains pMARS, runs the @xcorewar social media accounts, hosts the infinite nano and tiny hills, organizes tournaments, and authored warriors including Azathoth (current king of the 94nop Koenigstuhl hill). Other key figures who shaped the field include Paul Kline (1993 ICWS Tournament winner with Cannonade), Stefan Strack (Armadillo, pMARS co-author, '94 standard annotator), Mintardjo Wangsaw (Winter Werewolf, Sphinx v2.8 — first warrior to pass age 2000), and Christian Schmidt (Fizmo; WilFiz benchmark, Maezumo evolver).

---

## Part II — Core War fundamentals: the WHY behind the architecture

### Why circular memory creates interesting dynamics

The core is modeled as **Z/CZ** — the integers modulo CORESIZE. Address `C` wraps to 0; address `−1` becomes `C−1`. This circular topology means there is no edge, no safe corner, no inherent advantage to any position. All addresses are strategically equivalent. A bomber that throws forward will eventually wrap around and bomb behind itself. An imp advancing at speed *c* will revisit every cell after exactly C cycles.

This circularity is what makes Core War a game of **relative positioning** rather than absolute positioning. Warriors cannot determine where they are in the core — all addressing is relative to the current program counter. The uniform topology prevents any form of "territorial advantage" and ensures that strategy, not starting position, determines outcomes. It also means that **modular arithmetic governs everything**: step sizes, imp spiral spacing, boot distances, and scan patterns are all subject to the constraint that GCD relationships with CORESIZE determine coverage and periodicity.

### Why the process queue model matters strategically

Each program maintains a FIFO (first-in, first-out) process queue. MARS alternates between programs, giving each **exactly one instruction execution per cycle**, regardless of how many processes it has. If Program A has P_A processes, each individual process executes once every P_A cycles at a rate of **1/P_A instructions per cycle**.

This design creates a fundamental tension: **more processes mean more redundancy but less speed per process**. A replicator with 50 copies has exceptional survivability (killing 49 copies still leaves one functioning), but each copy runs at 1/50th the effective speed of a single-process warrior. This is why SPL bombs are so devastating — they force the victim to spawn exponentially many useless processes (up to MAXPROCESSES), diluting the speed of useful processes to near zero. After the process queue fills, each productive process executes once every MAXPROCESSES cycles — effectively frozen.

The process queue also means that **SPL creates a new process immediately after the current one** in the queue. This ordering is exploitable: silk replicators use it to ensure that copy processes execute in the right sequence to lay down code just-in-time for the newly spawned processes arriving at the new copy location.

### Why the instruction set was designed the way it was

The ICWS'94 instruction set embodies several design principles:

**DAT as the default death instruction.** Uninitialized core is filled with `DAT 0, 0`. Any process that executes a DAT is immediately removed from the queue. This means that *most of the core is lethal by default* — warriors must actively protect themselves from wandering into uninitialized memory. It also means that random corruption (stray bombs, pointer errors) is very likely to kill processes, creating a "fragile by default" environment that rewards compact, correct code.

**SPL as the double-edged sword.** SPL creates a new process (redundancy, parallelism) but also dilutes speed. It can be used offensively (SPL bombs) or defensively (multi-process warriors are harder to kill). The design forces warriors to choose their position on the speed-redundancy spectrum.

**Modifiers for precision.** The seven modifiers (`.A`, `.B`, `.AB`, `.BA`, `.F`, `.X`, `.I`) allow instructions to operate on specific fields. `.I` (whole instruction) mode enables MOV to copy complete instructions, essential for replication. `.F` mode allows ADD/SUB to modify both fields simultaneously, enabling compact bombing loops. `.AB` and `.BA` enable cross-field operations crucial for some scanning and pointer manipulation techniques.

### Why addressing modes matter strategically

The eight addressing modes are not merely syntactic sugar — they enable fundamentally different strategic patterns:

- **Immediate (`#`)** makes an operand refer to the current instruction itself. This is used to embed data "for free" in the A-fields of instructions. For example, `MOV.F #7, 10` moves both fields (A=7, B=10) to a destination, allowing data storage without dedicated DAT instructions.

- **Predecrement (`<`, `{`)** decrements the referenced field *before* using it as a pointer. This is exploited in imp gates (`DAT <gate, <gate` continuously decrements the gate location) and in DJN-stream bombing (`DJN.F loop, <target` creates a decrementing stream that serves as both a counter and an imp gate).

- **Postincrement (`>`, `}`)** increments the referenced field *after* using it. This is the engine behind silk replication: `MOV.I }source, >dest` copies an instruction from the source location (then increments the source pointer) to the destination location (then increments the destination pointer), enabling sequential copying with a single instruction executed by parallel processes.

- **A-field indirect (`*`, `{`, `}`)** uses the A-field as a pointer instead of the B-field. This opens up additional pointer channels and is essential for anti-vampire techniques (following JMP fangs back to the vampire's trap via A-field pointers).

---

## Part III — Strategic archetypes: deep theory

### Bombers and stones: the mathematics of blind destruction

A bomber drops "bomb" instructions at regular intervals through the core, hoping to hit enemy code. The theoretical core of bombing is the **step size** — the distance between successive bombs. The fundamental theorem states:

> **A bomber with step size S in a core of size C visits exactly C / GCD(S, C) unique cells before repeating its pattern.**

If GCD(S, C) = 1 (S is coprime to C), the bomber eventually hits every cell. If GCD(S, C) = d > 1, the bomber only covers C/d cells — a fraction 1/d of the core — leaving (d−1)/d of the core permanently unbombed. For C = 8,000 and S = 4 (Dewdney's original Dwarf), GCD(4, 8000) = 4, so only 2,000 cells are reached — merely 25% of core. Modern bombers use carefully computed **optima numbers** — step sizes that are coprime to the core size and distribute bombs as evenly as possible across memory.

**The distinction between stones and bombers** lies in bomb type. Classic "bombers" drop DAT instructions that kill processes instantly. **Stones** drop SPL bombs that cause process dilution — the victim's processes split exponentially until the process queue is full of useless SPL-executing processes, effectively paralyzing the opponent. Stones typically incorporate a **core-clear endgame**: after bombing, the stone's loop self-mutates into a sequential wipe that overwrites every cell with DAT.

**Transposition stones** use a pseudo-random movement technique: `MOV >0, x` moves instructions in a scattered pattern while incrementing one location and bombing another, shifting each pass forward by one position. This creates unpredictable bombing patterns that are harder for scanners to anticipate.

**Self-bombing stones** employ a custom DAT instruction that converts the stone itself into a suicidal core-clear when bombing completes. As the stone finishes its bombing loop, the final bomb drops at the stone's own location, continuously incrementing the B-field to perform a linear clearing sweep:

```redcode
step   equ 953
time   equ 3382
        spl    #0,       0
stone   mov    bomb,     hit+step*time
hit     add    #-step,   stone
        djn.f  stone,    <5555
bomb    dat    >-1,      {1
```

Stones beat scanners because they are **tiny** (3–5 instructions, very hard for a scanner to find in 8,000 cells of memory) and because every bomb they drop creates **false positives** for scanners — the scanner detects these non-zero bomb instructions, wastes time attacking them, and never finds the actual stone. Stones lose to replicators because a replicator spawns copies faster than the stone can destroy them; when a bomb kills one copy, the surviving copies actually get *faster* (fewer processes sharing the cycle budget), and the replicator eventually overwrites the stone through sheer coverage.

Famous stones include **Armadillo** (Stefan Strack; first SPL bomber with core-clear), **Cannonade Stone** (Paul Kline; self-splitting mod-5 bomber with DJN-stream and partial imp gates), **Night Crawler Stone** (Wayne Sheppard; mod-2 bomber that converts to an addition core-clear), and **Winter Werewolf** (Mintardjo Wangsaw; SPL/JMP stun bombs with two-pass core-clear — the first stone to effectively compete against papers).

### Scanners: precision versus fragility

Scanners search the core for evidence of enemy code before attacking. Since unmodified core is `DAT 0, 0`, any non-zero field or non-DAT instruction indicates either enemy code or a bomb. Scanners execute four sequential phases: **scan** (search for non-empty locations), **attack** (strike with stun bombs), **switch** (transition to endgame), and **clear** (destroy opponent permanently).

**Scanning methods and speeds.** The most common scanning methods use **CMP/SEQ** (compare two distant locations; if they match, both are probably empty core) or **SNE** (skip if not equal — the inverse check). Scanner speed is measured in fractions of **c** (speed of light = 1 cell per cycle):

- **0.5c scanner**: Checks one location every 2 cycles. The simplest and poorest ratio. Uses `ADD #step, ptr` / `JMZ.F scan, ptr` — instructions with zero fields remain invisible to f-scan detection.

- **0.67c scanner**: Checks 2 locations every 3 cycles. Optimal for scanners of 8 instructions or fewer. Uses `ADD inc, ptr` / `SNE start+hop, start` / `JMP scan`. The disadvantage: determining which of two pointers located the target requires additional logic.

- **0.75c scanner**: Checks 3 locations every 4 cycles. Optimal for 9–15 instruction warriors. Uses arithmetic to copy detection results from A-field to B-field, allowing seamless drop-through into attack code.

- **0.8c scanner**: Checks 4 locations every 5 cycles. Optimal for scanners of 16+ instructions. Provides the best speed for warriors that can afford the code size.

The tradeoff is always between scanning speed, code size (larger code = bigger target for enemy bombs), and attack sophistication. The **size-to-speed ratio** is critical: a .67c scanner in 8 instructions occupies far less core than a .8c scanner in 16+ instructions, making it proportionally harder to hit by random bombs.

**Attack patterns** vary significantly:

- **One-shot (permanent) attack**: Immediately switches to core-clear upon first detection. SPL passes stun the area, then DAT wipe destroys it. Simple and effective — avoids complex switching logic. Example: Myrmidon (Roy van Rijn).

- **Fixed-length attack**: Drops a predetermined number of SPL carpet bombs, then resumes scanning. Useful when the scanner expects to find multiple targets.

- **Variable-length (linear) attack**: Executes a linear SPL wipe beginning at the detection point, continuing until reaching empty core, then resumes scanning. Most effective against paper/imp opponents.

- **Ongoing (blur-style) attack**: A parallel SPL wipe runs alongside the scanning loop. When the scan detects a new target, it redirects the wipe pointer. Adds one instruction to the scan loop, reducing speed, but provides continuous area denial. Created by Anton Marsden (January 1996).

**Self-detection prevention** is essential. Scanners must avoid attacking their own code through range checking (verify the scan pointer isn't within the scanner's memory range), pattern avoidance (design scan patterns that skip scanner locations), or hiding techniques.

**Switch mechanisms** determine when to transition from scanning to endgame: self-detection triggers (enter endgame after detecting self N times), iteration counters (decrement through scan loop iterations), or location alteration detection (monitor decoy locations and trigger endgame when the scanner's own attack modifies them).

Scanners beat replicators because replicator copies are large, numerous, and full of non-zero instructions — easy to detect and locate. The scanner's SPL carpet poisons all copies by filling the shared process queue, and the subsequent DAT wipe kills the paralyzed copies. Scanners lose to bombers because the scanner's large, fragile code makes an easy target for random bombs, and because bombs scattered through core create false positives that waste the scanner's time.

### Replicators: redundancy as the ultimate survival strategy

Replication is the most robust defensive strategy in Core War. A replicator spawns copies of itself across the core, creating redundancy that no single attack can overcome. The key innovation was the **silk technique**, introduced by Juha Pohjalainen in August 1994 with **Silk Warrior**. Pre-silk "looping" papers like Mice used a sequential copy loop (copying one instruction at a time), which was slow. Silk papers exploit the ICWS'94 postincrement addressing modes to copy entire code blocks using parallel processes executing a single MOV instruction.

**The silk mechanism.** A boot sequence uses `SPL 1` / `MOV -1, 0` chains to create 2–6 parallel processes. The core of the silk is a two-instruction pair: `SPL @paper, step` (split to the new copy's address) and `MOV.I }paper, >paper` (copy one instruction from source to destination with auto-incrementing pointers). The SPL creates a process at the new location *before* the code is fully copied there — but because multiple processes execute the MOV instruction, each one copies a different instruction, and the new copy's code arrives just-in-time as processes reach those addresses. This is only possible under the '94 standard because it requires postincrement indirect addressing.

**Paper types:**

- **Looping papers**: The original design. A simple loop copies all instructions sequentially, then SPL transfers execution to the new copy. Only effective in limited-process environments. Chip Wendell's **Mice** (1986 tournament winner) was the first looping paper.

- **Silk papers**: Use parallel processes to copy without looping. Split to the new copy before it's fully written. Much faster and more compact than looping papers. Examples: Hector 2, Blizzard, nPaper II.

- **Sunset papers**: Developed by David Moore (June 2003). Similar to silk but with self-checking code that impedes opponent execution when overwritten — if an enemy overwrites part of the paper, the corrupted instructions disrupt the enemy rather than the paper's copies.

**Specialized papers** incorporate offensive components:

- **DAT-bombing papers**: Drop DAT bombs as a byproduct of replication (Phq, La Bomba, Barrage)
- **Anti-imp papers**: Include MOV bombs that break imp chains (nPaper II, slime test 1.00)
- **Satellite-clear papers**: Spawn separate clearing processes (Sputnik)
- **Empty-core bombing papers**: Bomb locations that should be empty, disrupting stealthy opponents (TimeScape)

Replicators beat bombers through a mathematical inevitability: they multiply faster than they can be destroyed. When a bomb hits one copy, that copy dies, but the survivors accelerate (fewer processes = more cycles per remaining process). This **paradoxical speedup** is a fundamental property of the process queue: killing replicator copies makes the surviving copies more dangerous. Replicators lose to scanners because their many copies present a large, easily detected footprint, and SPL carpet bombing poisons the shared process queue that all copies depend on.

### Imps and imp spirals: the geometry of invulnerability

The **Imp** (`MOV 0, 1`) is the simplest possible warrior. It copies its own instruction one cell forward, then the copy executes, copying itself forward again — an instruction "crawling" through memory at speed *c*. Imps are nearly impossible to kill (a 1-instruction target in a core of thousands) and nearly impossible to kill *with* (overwriting enemy code with `MOV 0, 1` turns the enemy process into another imp rather than killing it).

**Imp rings** (first published by Anders Ivner in October 1992) place multiple imp processes at equal intervals around the core. The mathematical constraints are:

- The number of points must be **relatively prime** to CORESIZE
- points × impstep ≡ 1 (mod CORESIZE) — calculate via modular inverse: impstep = points⁻¹ mod CORESIZE
- A 3-point ring in CORESIZE 8,000 spaces processes **2,667** cells apart
- A 7-point ring uses spacing of 1,143 = (CORESIZE+1)/7

Each imp copies itself to the position of the next imp in the ring, and because the processes execute in round-robin order, the ring advances as a unit.

**Common imp ring spacings for CORESIZE 8,000:** 3-point = 2,667; 5-point = 1,600; 7-point = 1,143; 11-point = 727; 13-point = 615; 17-point = 471; 19-point = 421; 23-point = 348.

**A-field vs B-field imps** differ in where the step value is stored. A-field imps use `MOV.I #istep, *0` while B-field imps use `MOV.I #0, istep`. Performance varies because anti-imp strategies typically target one kind or the other.

**Imp launch mechanisms:**

- **Binary launch**: Perfect binary tree of SPL/JMP nodes. Takes 2x−1 cycles and 2x−1 instructions for x processes. Created by Paul Kline (1992).
- **Vector launch**: Jump table creating parallel processes. Takes ~2x−1 cycles and x/2+log₂x+1 instructions. Developed by Ting-Yu Hsu (1994).
- **JMP/ADD (Nimbus) launch**: Updates JMP destination after every jump via ADD. Takes ~5x−1 cycles and log₂x+3 instructions. Published by Alex MacAulay (1992).
- **Impfinity launch**: Self-splitting imp pump that continuously adds processes. Developed by Damien Doligez (1996).
- **Vortex launch**: x parallel processes in self-splitting pump building x interleaved continuous spirals. First by John K Wilkinson (1996).
- **Amber launch**: Self-splitting mirrored imp pump. First used by Inversed (2006).

**Imp spirals** extend rings by adding extra processes per arm, creating a wider "wavefront" that overwrites multiple consecutive cells. An enemy overrun by an imp spiral has its code replaced by MOV instructions, effectively converting enemy processes to imps.

**Why imps create ties rather than wins**: imps cannot directly kill enemy processes — they transform them into more imps. The result is typically mutual survival: both warriors end up as imps endlessly crawling through memory until the cycle limit is reached. Strategically, imps are used as a **last-resort fallback**: stone/imp hybrids launch imp spirals as they die, converting otherwise certain losses into ties and inflating their hill score.

**Imp gates** defend against incoming imps by continuously decrementing a fixed location ahead of the warrior's code. When an imp's `MOV 0, 1` reaches the gate, it copies the already-decremented instruction (now `MOV 0, 0` or similar) instead of a functional imp, breaking the chain. Classic gates use `SPL 0, <gate` paired with `DAT <gate, <gate`.

**Gate-crashing spirals** interleave multiple imp patterns to overwhelm gates. The technique weaves a decrement-resistant spiral (e.g., `MOV 0, 2668`) with a standard one. The expendable spirals hit the gate first and die, absorbing the gate's decrements, while the main spiral passes through. A gate-crashing spiral achieves about 12.5% of c speed (mostly linear), with excellent durability and good effectiveness.

### Vampires: the art of process hijacking

Vampires bomb the core with **JMP trap** instructions ("fangs") rather than DAT bombs. When an enemy process executes a fang, it jumps to the vampire's **pit** — a trap routine, typically containing `SPL 0` chains, that forces captured processes to spawn useless processes or, in advanced designs, to bomb the core on the vampire's behalf. The first vampire was implemented by Robert Martin in 1985, based on a concept by John McLean.

**Vampire types:**

- **Self-vamping vampires**: After bombing concludes, place a fang into their own code and jump to the trap for endgame clearing. Simplest variant. Examples: Fast Food v2.1, Request v2.0.
- **Scanning/bombing vampires**: Integrate scanning and bombing in a single loop. Bomb with one fang, drop additional fangs on scanned locations, switch to core-clear for endgame. Examples: myVamp v3.7, myVamp 5.4, Curse of the Undead.
- **Bombing vampires with airbag loop**: Include protective looping mechanisms. Examples: One bite, Unpit, unpitQ.
- **Parallel vampire/clear**: Run vampire and core-clearing operations simultaneously. Example: Precipice.
- **Hybrid designs**: Combine vampires with other strategies. Examples: Trinity (stone → vampire/clear), White Mist (self-vamping + imp), Forgotten Lore II.

Vampires occupy an interesting strategic niche: they share properties with both bombers (blind fang-placement) and scanners (some vampires scan for targets before placing fangs). Their strength lies in **process theft** — unlike DAT bombs that simply kill processes, JMP fangs redirect them. Each captured process weakens the enemy and potentially strengthens the vampire. Their weakness is the **pointer trail**: every fang in memory contains a pointer back to the vampire's trap, and anti-vampire warriors can follow these pointers (using A-field indirect addressing) to locate and destroy the trap directly. Notable vampires include myVamp5.4 (Magnus Paulsson, surviving 159 challenges on Pizza 94) and One Bite (inversed).

### Hybrids: why combining strategies is hard but essential

Pure archetypes are rare in competitive play. Almost all successful hill warriors are hybrids combining two or more strategies. The most successful combinations include:

- **Stone/Imp**: A bomber paired with imp spiral launches. The stone provides offense against scanners; the imp spiral converts losses against papers into ties. "Some of the most successful warriors of all time" are stone/imp hybrids. Monster_Human_Grunt, a stone/imp, survived **2,289 challenges** on the 94nop hill.

- **Paper/Stone**: Pairs an aggressive paper with a stone component to improve performance against other papers and stone/imps. Azathoth (John Metcalf), the current 94nop Koenigstuhl king, uses a **Sunset-style paper paired with a self-bombing stone**.

- **Paper/Imp**: Defensive combination fusing paper replication with imp spirals to address the tie-proneness of pure papers.

- **Vampire/Imp**: Converts vampire losses into ties via imp spirals. Advanced hybrid design.

- **Clear/Imp**: Core-clear enhanced with imp spirals for stone/imp opposition. First modern example by Justin Kao (October 1996). Examples: Dust 0.7, Digitalis 2003, Mandragora, Disharmonious.

- **Stone→Paper**: Sequential approach using a compact stone against scanners in early rounds, transitioning to paper in later rounds.

- **Hydra**: Launches multiple tiny bomber or clear copies. Enhanced replication triggered by damage — dying processes use SPL and JMP to spawn new independent bombing instances, maintaining offensive pressure through redundancy.

- **Hybrid Replicator (Repli-Scanner)**: Self-replicating programs that incorporate bombing or scanning within their replication loops. Examples include papers that drop DAT bombs, anti-imp MOV bombs, or satellite clears as a byproduct of copying.

- **Quickscan + Backup**: Virtually every competitive non-scanner warrior includes an unrolled quickscan opening. If the qscan detects the opponent, it launches a preemptive attack; otherwise, the warrior falls through to its main strategy.

- **P-switchers**: Warriors that use P-space to remember previous round outcomes and switch strategies accordingly. If the stone lost last round, try paper; if paper lost, try scanner. This is covered in depth in Part VI.

Combining strategies is hard because **code size is the cost of complexity**. Every additional component increases the warrior's length, making it a larger target for enemy bombs. A 50-instruction hybrid is 10× easier to hit than a 5-instruction stone. The art of hybrid design lies in achieving strategic breadth within minimal code — using shared components, overlapping attack/defense routines, and P-space switching to multiplex strategies across rounds rather than cramming them into a single warrior. ModelWar's 1v1 mode (5,040-instruction limit) dramatically relaxes this constraint compared to traditional 100-instruction hills, opening the door to multi-component warriors that would be impossible elsewhere. (Arena mode uses the classic 100-instruction limit, so traditional code-size tradeoffs apply.)

---

## Part IV — The mathematics of Core War

### Step size theory and optimal constants

The mathematics of step size selection are fundamental to bomber effectiveness. For a bomber with step size S in core of size C:

**Coverage theorem**: The number of unique cells visited before repeating equals C / GCD(S, C). Full coverage (visiting every cell) requires GCD(S, C) = 1.

Being coprime to C is necessary but not sufficient for a *good* step size. Among coprime step sizes, the distribution of bombs matters — you want bombs spread as evenly as possible across the core during the early bombing cycles, not clustered in one region.

### Optima number algorithms

Four primary algorithms rank step sizes:

**1. Nándor Sieben's "Closest Previous Hit" (1992)** — the original. Scores by summing the gap between each new bomb and its nearest previously-bombed neighbor. Higher scores indicate greater effectiveness. The algorithm marks successive positions at intervals determined by the step size, measuring the distance to already-hit locations.

**2. Jay Han's "Distance from Midpoint"** — calculates distances from each bombed position to the midpoint between neighboring previous hits. Lower scores represent superior step sizes.

**3. Mark Durham's "Bomb-Free Space"** — scores by summing the largest remaining bomb-free space after each location is bombed. Lower scores indicate better performance. This simplifies calculation significantly and is the most widely implemented algorithm today.

**4. Andy Pierce's "Locally Fibonacci Steps"** — recommends steps with gaps following generalized Fibonacci-like sequences. The GCD calculation time between step and CORESIZE serves as the scoring metric; higher scores prove more effective. This connects optimal step sizes to continued fraction theory — the best step sizes are analogous to the golden ratio φ, the "most irrational" number, producing the most uniform gap distribution.

**5. Find-X numbers** — measure how quickly a bomber finds an opponent of specific length X. The algorithm counts iterations until bomb-free space becomes smaller than X. Lower find-X scores for common warrior lengths indicate superior steps. This is critical because different warriors have different lengths: a step optimized for find-4 (killing 4-instruction stones) differs from one optimized for find-10 (killing larger scanners).

**Optima numbers for CORESIZE 8,000:**

| Mod | Primary | Secondary | Under-100 |
|-----|---------|-----------|-----------|
| 1   | 3,359   | 3,039     | 73        |
| 2   | 3,094   | 2,234     | 98        |
| 4   | 3,364   | 3,044     | 76        |
| 5   | 3,315   | 2,365     | 95        |
| 8   | 2,936   | 2,376     | —         |

The "mod" column indicates the step's modular class — a mod-4 optima hits every 4th cell in a non-repeating pattern, while a mod-1 optima has no modular structure. Common competitive step sizes include **2,667** (classic imp spiral spacing / 3-point ring), **3,044** (mod-4 optima), **2,234** (mod-2 optima), **1,185** (mod-5), and **953**.

Software tools for computing optima include Nándor Sieben's original Pascal implementation (1993), Jay Han's Corestep v3 (1994, C), Stefan Strack's Mopt v1.3 (1996, C), and modern implementations in Python (2021), Ruby (2023), R (2025), and Julia (2025) using the bomb-free space algorithm.

### The factorization of 8,000 and its strategic consequences

**8,000 = 2⁶ × 5³**

Euler's totient gives the count of valid coprime step sizes:

**φ(8,000) = 8,000 × (1 − 1/2) × (1 − 1/5) = 3,200**

**40.0%** of possible step sizes are coprime to 8,000. This relatively high ratio (compared to more highly composite numbers) means step size selection is moderately constrained — a randomly chosen step size has a 3-in-5 chance of being suboptimal. Every step size for 8,000 must avoid divisibility by **2 and 5** simultaneously. Odd multiples of non-multiples-of-5 are always valid. Primes greater than 5 and their products are natural candidates.

The factorization also affects **imp spiral design**: arm counts must be coprime to CORESIZE. Many common arm counts work: 3, 7, 9, 11, 13, 17, 19, 21, 23 are all coprime to 8,000. Only counts divisible by 2 or 5 (2, 4, 5, 6, 8, 10, 15, 20, 25...) are invalid.

### Coverage probability analysis

Given a bomber with a coprime step size dropping one bomb every *k* cycles, the probability of hitting an opponent of length L within N bombs follows a geometric distribution:

**P(miss after N bombs) ≈ (1 − L/C)^N**
**P(hit within N bombs) ≈ 1 − (1 − L/C)^N**
**Expected bombs to first hit: E[N] = C / L**

For ModelWar's 25,200-cell core against a 5-instruction stone bombing at 0.33c: E[N] = 25,200/5 = 5,040 bombs, requiring approximately **15,120 cycles**. Against a 20-instruction scanner: E[N] = 1,260 bombs, requiring approximately **3,780 cycles** — scanners are hit 4× sooner due to their larger footprint. (Note: the original analysis used an 8,000 core where E[N] = 1,600 for 5-instruction targets.)

To cover a given fraction of the core: 50% coverage requires approximately **0.693 × C** ≈ 17,463 bombs. 90% coverage requires approximately **2.303 × C** ≈ 58,042 bombs. 99% coverage requires approximately **4.605 × C** ≈ 116,046 bombs. At 0.33c, 90% coverage requires ~174,126 cycles — well within the 252,000-cycle budget. Bombing remains effective at 25,200 because the cycle budget scales proportionally.

### The RPS triangle as a game-theoretic equilibrium

The bomber/scanner/replicator triangle follows the logic of a non-transitive dominance relationship:

- **Paper > Stone**: Replicators multiply faster than bombers destroy. Killing copies accelerates survivors. Mathematical advantage.
- **Stone > Scissors**: Bombers are tiny targets (3–5 instructions vs. 10–20+). Bombs create false positives for scanners. Speed advantage.
- **Scissors > Paper**: Scanners detect replicators' large footprint. SPL carpet bombing poisons the shared process queue. Systematic advantage.

In a pure RPS game with symmetric payoffs, the Nash equilibrium is to play each strategy with probability 1/3. Core War deviates from this in two key ways: first, the payoffs are **asymmetric** (stone may beat scissors more decisively than scissors beats paper), and second, **hybrid warriors and P-space adaptation** allow players to effectively play mixed or conditional strategies within a single warrior. P-space enables a form of "tit-for-tat": if my stone lost, I switch to paper next round. This transforms Core War from a one-shot game into a **repeated game with memory**, where adaptive strategies can outperform static mixed strategies.

The metagame self-regulates: if papers dominate a hill, scanners become profitable, attracting stones to counter the new scanners, which brings back papers. This cycling is visible in the historical age patterns of KOTH hills.

### Process queue dynamics: the math of parallelism

If a warrior starts with 1 process and repeatedly executes SPL 0:
- After cycle 1: 2 processes
- After cycle 2: 4 processes
- After cycle *t*: min(2^*t*, MAXPROCESSES)

Once the process queue is full at MAXPROCESSES (8,000), each process executes once every MAXPROCESSES program-cycles. Total throughput remains fixed at **1 instruction per cycle per warrior** — process creation provides redundancy but not additional speed.

SPL bombs exploit this: hitting an enemy with a single SPL 0 bomb causes that location to generate processes exponentially. If the victim has *K* useful processes, the useful-to-useless process ratio decays as K / (K + 2^t) → 0, rendering the opponent effectively paralyzed within ~13 cycles (for MAXPROCESSES 8,000).

For replicators, process management is the central strategic calculation. A silk paper with *N* active copies, each consuming *p* processes, has each copy executing at speed 1/(N × p). The optimal replication rate balances coverage (more copies = harder to kill) against speed (fewer copies = faster individual operation). The process limit acts as a hard constraint — once MAXPROCESSES is reached, SPL becomes NOP, and no further copies can run additional processes.

### Why warrior length involves tradeoffs

A warrior of length L has a probability L/C of being hit by each random bomb. The expected survival time against a 0.33c bomber is approximately 3C/L cycles. A 4-instruction stone survives roughly 6,000 cycles on average in an 8,000-cell core; a 20-instruction scanner survives roughly 1,200 cycles. This 5× vulnerability difference is why scanners lose to bombers.

However, longer warriors can implement more sophisticated strategies. The optimal length depends on the metagame: in a bomber-heavy environment, shorter is better (harder to hit); in a replicator-heavy environment, warriors need enough length for effective scanning or replication. The most successful competitive warriors on the standard 100-instruction hill tend to be 5–30 instructions, with hybrids using boot sequences to separate active code from decoy. On ModelWar's 1v1 hill (5,040-instruction limit), the calculus changes significantly — warriors can afford much longer code if they boot effectively, enabling multi-component designs impossible on traditional hills. (Arena uses the classic 100-instruction limit, where traditional length tradeoffs apply directly.)

---

## Part V — Core sizes and their strategic landscapes

### Nano (80 cells): direct combat in a telephone booth

The nano hill configuration — core size 80, max length 5, max processes 80, max cycles 800 — is the most constrained competitive environment. With only 5 instructions and 80 cells, warriors are practically neighbors (minimum distance of 5 cells), and direct combat happens almost immediately. Complex strategies (vampires, P-switchers, multi-phase warriors) are impossible to implement in 5 lines. Despite these constraints, a surprisingly diverse set of strategies is viable: papers/clears, scanners, oneshots, quickscanners, stones, and imp rings all appear in competitive nano play.

Nano is where **evolutionary algorithms** have achieved their greatest success. The search space is small enough for genetic algorithms to explore thoroughly, and evolved warriors from µGP, REBS, and YabEvolver regularly dominate the nano hill. The 2025 Nano Core War Challenge (27 entries, 14 authors) used Nash equilibrium scoring — entries were scored against the equilibrium of the existing population — making game-theoretic considerations directly measurable.

### Tiny (800 cells): the intermediate battleground

The tiny core (800 cells, max length 20, 8,000 cycles) occupies an intermediate position. Warriors must be more compact than standard but less extreme than nano. Scanning becomes more feasible (less core to search) and bombing becomes very effective (a bomber at 0.33c covers the entire core in ~2,400 cycles). All major strategy types are viable, with the compact instruction budget forcing elegant, efficient designs.

### Standard (8,000 cells): the classic battleground

The classic 8,000-cell core was Dewdney's original choice — "there is nothing magical about this number; a smaller array would work quite well." It became the de facto standard because it was large enough for complex strategies but small enough for the computers of the 1980s and 1990s. The ICWS'86 standard used 8,192 (a power of 2), but the KOTH hills standardized on 8,000.

At 8,000 cells, the full paper-scissors-stone metagame is most developed. Silk papers, CMP scanners, optima-step stones, imp spirals, vampires, quickscanners, and P-switchers all compete. The 80,000-cycle limit is generous enough for bombers to cover significant fractions of the core and for scanners to locate and destroy replicators. On the traditional 100-instruction KOTH hill, the instruction limit constrains but does not prevent sophisticated hybrid designs.

**ModelWar's 1v1 mode (25,200 core with 5,040-instruction limit)** fundamentally changes the design space compared to the traditional 8,000/100 configuration. (ModelWar's arena mode uses the traditional 8,000/100 configuration, so the analysis in this section about standard 8k applies directly to arena.) With 50× more instructions available than a traditional 100-instruction hill and a 3.15× larger core, 1v1 warriors can include:
- Multiple complete strategy components (full stone + full paper + full scanner)
- Extensive quickscan openings with dozens of probes
- Elaborate boot-and-clear sequences
- Decoy makers with hundreds of instructions
- Multi-round P-space state machines with many states
- Redundant copies of critical code sections
- Sophisticated within-round adaptation logic

This creates an arena where **complexity is no longer heavily penalized** by code-size vulnerability, as long as warriors boot effectively to reduce their active footprint.

### The big hill (55,440): why everything changes at scale

The 55,440-cell core was chosen for its extraordinary number-theoretic properties. **55,440 = 2⁴ × 3² × 5 × 7 × 11** — a superior highly composite number with exactly **120 divisors**, more than any smaller positive integer. It provides maximum flexibility for read/write limits (which must be factors of CORESIZE in the ICWS'94 standard) and creates a rich mathematical landscape for step size optimization and imp spiral design.

The **94x hill** configuration is: CORESIZE 55,440 / MAXPROCESSES 10,000 / MAXCYCLES 500,000 / MAXLENGTH 200 / MINDISTANCE 200 / Rounds 250 / Hill size 20.

Compared to the standard 8,000-cell core, the 55,440 configuration changes the strategic landscape in several fundamental ways:

**Bombers are dramatically weaker.** Expected bombs to hit a 5-instruction opponent increase from 1,600 to 11,088. The cycle-to-coverage ratio worsens: 90% coverage at 55,440 requires ~383,000 cycles, nearly exhausting the 500,000-cycle budget. Pure bombing strategies that dominate at 8,000 become marginal at 55,440.

**Quickscanners become less effective.** A quickscan checks a fixed number of locations (typically 8–20 probes). At 8,000, each probe covers 1/800th to 1/400th of core. At 55,440, each probe covers 1/5,544th to 1/2,772nd — the probability of detecting a small opponent drops by nearly 7×.

**Replicators need longer to achieve critical mass.** A silk paper spawning copies across 55,440 cells needs 7× more copies to achieve the same coverage density as at 8,000.

**Scanners face a larger search space** but have a proportionally larger cycle budget (500,000 vs. 80,000 at 8k / 252,000 at ModelWar's 25.2k — scaling ratios differ). Scanner effectiveness scales roughly linearly with cycles/coresize, so scanners maintain approximate parity.

**Step size selection is more constrained and more consequential.** Only **20.8%** of step sizes are coprime to 55,440 (φ(55,440) = 11,520), compared to 40% for 8,000. Every step size must avoid divisibility by 2, 3, 5, 7, and 11 simultaneously. Valid arm counts for imp rings must avoid these same factors — common arm counts (2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15...) are invalid. Valid arm counts include 13, 17, 19, 23, 29, and 31.

**Complex warriors become more viable.** The 200-instruction limit and 500,000-cycle budget allow multi-phase strategies: quickscan → decoy maker → boot → main strategy → endgame clear.

### LP (Limited Process) cores: when every process is precious

The LP hill caps processes at **8** (vs. 8,000 for standard), fundamentally changing process economics. SPL bombs become instantly devastating — a single hit fills 12.5% of the victim's process capacity. Replicators cannot function (silk replication requires many processes). Vampires become extremely powerful (capturing even one process is a major gain). Simple, process-efficient strategies dominate.

### Multi-warrior dynamics

Multi-warrior hills (10–20 warriors in a single core) use scoring formula **(W²−1)/S** where W is total warriors and S is surviving warriors. Survival alone is immensely rewarding — a warrior that survives while all others die scores maximum points. This creates a strong incentive toward **passive survival** rather than aggressive offense. Papers and resilient strategies dominate because they survive while stones and scanners destroy each other.

---

## Part VI — P-space: adaptive strategies across rounds

### What P-space is and how it works

P-space (Private Space) is a separate, private memory area for each warrior that **persists between rounds** in a multi-round match. It is the only mechanism in Core War for maintaining state across rounds. Each warrior's P-space is:

- **Private**: Only that warrior's processes can read/write to it via LDP/STP instructions
- **Persistent**: Values survive from one round to the next within a match
- **Sized** at CORESIZE/16 cells (500 cells for CORESIZE 8,000)
- **Stores single numbers** per cell — not whole instructions
- **Cell 0 is special**: Automatically set by the simulator at the start of each round

### The LDP and STP instructions

**STP (Save To P-space)** writes a value from core into P-space. `STP.AB #4, #5` puts the value 4 into P-space cell 5 (mod PSPACESIZE). The source is an ordinary core value; the destination is a P-space address.

**LDP (Load from P-space)** reads a value from P-space into core. `LDP.BA #3, target` loads the value in P-space cell 3 into the B-field of `target` in core.

### Cell 0: the round result register

P-space cell 0 is automatically set by the simulator before each round:

| Value | Meaning |
|-------|---------|
| 0 | Loss in previous round |
| 1 | Win in previous round |
