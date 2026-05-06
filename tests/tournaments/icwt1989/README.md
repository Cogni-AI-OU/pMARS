# ICWT 1989 Tournament Simulation

This directory contains a simulation of the Fourth Annual International Core Wars Society Tournament (Feb 1990).

## Files
- `simulate.sh`: Shell script executing `pmars` to simulate the tournament rounds.
- `Makefile`: Makefile to run the simulation.

## Tournament Rules
- Standard: CWS'88 (`-8`)
- Coresize: 8000
- Cycles: 80,000
- Rounds: 10
- Points: 3 for win, 1 for tie

## Official Results
1st: HYPRAY by Francesco Botta
2nd: Wang1 by Alan Wang
3rd: Power Bomb by Bram Cohen
= : Quarter by Stefan Hänßgen
= : Random Fire by Bram Cohen

## Simulation Results
The simulation uses the `-f` (fixed) flag in `pMARS` to ensure deterministic and reproducible results. While historical scores might vary slightly due to minor `pMARS` implementation differences, the standings should be consistent. All 19 original warriors are included in this simulation.
