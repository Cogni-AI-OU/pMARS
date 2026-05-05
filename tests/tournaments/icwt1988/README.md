# ICWT 1988 Tournament Simulation

This directory contains a simulation of the Third Annual International Core Wars Society Tournament (Dec 1988).

## Files
- `simulate.sh`: Shell script executing `pmars` to simulate the tournament rounds.
- `Makefile`: Makefile to run the simulation.

## Tournament Rules
- Standard: ICWS'86
- Coresize: 8192
- Processes: 64
- Cycles: 50,000
- Format: Round-robin with 15 finalists
- Points: 3 for win, 1 for tie

## Official Results
1st: Cowboy by Eugene P. Lilitko
2nd: Lux 2 T by Luca Crosara
3rd: Mule DNA by Douglas McDaniels

## Simulation Results
The simulation results may vary slightly from the historical results due to differences in the `pMARS` simulator version and the randomness of starting positions in a round-robin tournament. In modern `pMARS`, `Cowboy`, `Lux 2 T` and `Mule DNA` are typically among the top performers, reflecting their historical strength.
