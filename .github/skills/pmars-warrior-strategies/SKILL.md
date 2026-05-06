---
name: pmars-warrior-strategies
description: Provide strategic analysis, design recommendations, and lifecycle breakdowns (opening, midgame, endgame) for Core War pMARS warriors.
---

# Skill pmars-warrior-strategies

<!-- markdownlint-disable MD013 MD023 MD031 MD032 -->

A reference guide for Core War opening, midgame, and endgame strategies to evaluate, counter, and design pMARS warriors effectively.

## Core Principles

- **Strategy Composition**: Warriors typically combine up to three stages: Opening (gain early advantage), Midgame (core combat loop), and Endgame (finishing off opponents).
- **Combat Dynamic**: The three basic midgame strategies form a triad: Stone beats Scissors, Scissors beats Paper, Paper beats Stone.

## Opening Strategies

Opening strategies run once at the beginning of the match before transitioning to the midgame.

- **Quickscan**: Uses an unrolled loop to scan rapidly and attack the opponent before their setup completes.
- **Bootstrap**: Copies core components to a new location, leaving a decoy to distract enemy scanners.
- **Decoy Maker**: Rapidly builds a decoy of incremented/decremented locations using an unrolled loop.
- **P-Switcher**: Selects between different midgame strategies based on the results of previous rounds.
- **Handshake**: Detects if fighting itself, forcing one copy to suicide to inflate the other's win score.

## Midgame Strategies

The primary combat loop and defining characteristic of the warrior.

- **Paper**: Spawns multiple parallel copies of itself. Small, resilient. Beats Stone, loses to Scissors.
- **Scissors**: Scans for opponents, hits with `SPL` to stun, then a deadly `DAT`. Large, hits hard. Beats Paper, loses to Stone.
- **Stone**: Blindly scatters simple `DAT` bombs through memory. Small, fast. Beats Scissors, loses to Paper.
- **Vampire**: Captures enemy processes with a `JMP` into its own code. Complex. Beats Scissors, loses to Stone.
- **Imp**: Moves through memory by copying itself just ahead of the instruction pointer.
- **Bomber**: Randomly drops complex bombs to damage/stun. Beats Scissors, loses to Stone.
- **Stone/Imp**: Pairs a stone with an imp spiral to reduce losses against paper.
- **Paper/Imp**: Defensive, tie-prone strategy combining two resilient forms.
- **Paper/Stone**: Aggressive paper paired with a stone to beat other papers and stone/imps.
- **Vampire/Imp**: Converts vampire losses to ties with an imp spiral.
- **Clear/Imp**: Imp spiral added to a core-clear to beat stone/imps.
- **Stone -> Paper**: Small stone eliminates scanners, then switches to paper.
- **Hydra**: Launches multiple copies of tiny bombers or clears.
- **Hybrid Replicator**: Self-replicating program that bombs or scans within the replication loop.

## Endgame Strategies

Switched to after the midgame to finish off damaged or stunned opponents.

- **Clear**: A core-clear wipes memory with deadly `DAT` bombs. Some use a `SPL` wipe to stun first. Often used by scanners and bombers.

## Usage Patterns

- Identify primary strategy components when analyzing an unknown `.red` file (e.g., parallel `SPL` loops indicate Paper, blind `DAT` drops indicate Stone).
- Select countermeasures based on the combat triad: add a Stone component to counter Scissors, or Paper to counter Stone.

## What to Avoid

- Over-engineering single-stage warriors without considering counters (e.g., pure Scissors vulnerable to fast Stones).
- Confusing basic Imps with viable standalone strategies—they must be paired (e.g., Stone/Imp) to be effective.

## Related Skills

- `pmars`
- `redcode`
- `redcode-icws94`
- `redcode-icws88`
