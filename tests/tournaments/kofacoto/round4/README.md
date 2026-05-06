# KOFACOTO Round 4 Tournament Simulation

This directory contains a simulation of the KOFACOTO (KotH Fall Corewar Tournament) Round 4.

## Tournament Context

- **Historical Date:** October - November 2000
- **Round 4 Theme:** Hostage Situation
- **Hostage:** `CIA.red` by Anders Ivner
- **Enemy:** `EvilJedimps.red` by John K W

## Rules

The round is a 3-way multiwarrior battle between the entrant's warrior, the CIA hostage, and the Evil Jedimp army.

### Scoring
- If CIA dies: 0 pts
- If the entrant's warrior dies: 0 pts
- If everyone survives: 1 pt
- If the entrant's warrior and CIA survive but Jedimp dies: 10 pts

### Parameters
- **Core Size:** 8000
- **Max Processes:** 8000
- **Cycles:** 80000
- **Max Warrior Length:** 100
- **Min Warrior Distance:** 100
- **Simulator standard:** ICWS'94

## How to Run

1. Compile `pmars` in the `src/` directory.
2. Run the simulation:
   ```bash
   python3 simulate.py
   ```

## Determinism

The simulation uses the `-f` flag with `pmars` to ensure consistent starting positions across runs.
