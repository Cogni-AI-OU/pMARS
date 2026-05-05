# ICWT 1990 Tournament Simulation

This directory contains a simulation of the Fifth Annual International Core Wars Society Tournament (Dec 1990).

## Files
- `simulate.sh`: Shell script executing `pmars` to simulate the tournament rounds.
- `Makefile`: Makefile to run the simulation.

## Tournament Rules
- Standard: CWS'88
- Coresize: 8192
- Processes: 64
- Entry length: 64
- Cycles: 125,000
- Rounds: 6
- Format: Round robin
- Points: 3 for win, 1 for tie

## Official Results
1st: Paper: A.K.A molerat by Scott Nelson
2nd: DoubleStormII by Matthew J. Chung
3rd: Ecstacy by Stefan Röttger

## Simulation Results
The simulation results may vary slightly from the historical results due to differences in the `pMARS` simulator version and the randomness of starting positions.