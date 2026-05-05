# Midgame Strategy

A warrior is defined by its midgame — either a basic strategy or a hybrid combining two or more components. Three of the most common strategies are named after the moves in the game *paper-scissors-stone*.

- [Paper](paper/README.md): A paper spawns multiple copies of itself and executes them in parallel. Paper is typically small and resilient, performing well against stones and losing to scissors.
- [Scissors](scan/README.md): Scissors scan for the opponent and hit hard, first stunning with a `SPL` attack then switching to a deadly `DAT` attack. Scissors are often large, scoring well against paper but losing to stones.
- [Stone](stone/README.md): A stone blindly scatters simple `DAT` bombs through memory in the hope of hitting an opponent. Stones are usually small and fast, performing well against scissors and losing to paper.
- [Vampire](vampire/README.md): Vampires attempt to capture enemy processes by placing a `JMP` inside the opponent's code. Vampires are often complex, scoring well against scissors, average against paper, and losing to stones.
- [Imp](imp/README.md): An imp moves through memory by copying itself just ahead of the instruction pointer. Modern imps run at multiple points in memory and are seldom seen alone, usually paired with paper or stone.
- [Bomber](bomber/README.md): A bomber randomly drops complex bombs designed to damage or stun the opponent. Bombers tend to score well against scissors, lose to stones and are sometimes capable of beating paper.
- [Stone/Imp](stoneimp/README.md): An imp spiral is often paired with a stone to reduce some of the losses against paper. Some of the most successful warriors of all time are stone/imps.
- [Paper/Imp](paperimp/README.md): A paper/imp combines two tie-prone strategies to create a defensive warrior that can be tricky to beat. They tend to score too many ties and not enough wins.
- [Paper/Stone](paperstone/README.md): A paper/stone usually pairs an aggressive paper with a stone to improve performance against other papers and stone/imps.
- [Vampire/Imp](vampireimp/README.md): One of the most complex strategies is the vampire/imp, which adds an imp spiral to convert some of the vampire's losses into ties. Vampire/imps are rarely seen on the hill.
- [Clear/Imp](clearimp/README.md): An imp spiral is often added to a core-clear to create a warrior that performs well against stone/imps.
- [Stone -> Paper](stonepaper/README.md): A stone -> paper uses a small stone to eliminate scanners, then switches to a paper to hopefully beat stones and tie other papers.
- [Hydra](hydrae/README.md): A hydra launches multiple copies of tiny bombers or clears.
- [Hybrid Replicator](hybridreplicator/README.md): A hybrid replicator is a self-replicating program that also bombs or scans within the replication loop.
