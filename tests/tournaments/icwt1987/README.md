# ICWT 1987 Tournament Simulation

This directory contains a simulation of the Second Annual International Core Wars Society Tournament (Nov 1987).

## Files
- `simulate.sh`: Shell script executing `pmars` to simulate the tournament rounds.
- `Makefile`: Makefile to run the simulation.

## Tournament Rules
- Standard: CWS'86
- Coresize: 8192
- Processes: 64
- Cycles: 50,000
- Rounds: 3
- Points: 3 for win, 1 for tie

## Official Results
1st: Ferret by Robert R. Reed III
2nd: Plague by Ron Paludan
3rd: Piper by Chip Wendell

## Simulation Results
The simulation results may vary from the historical results due to differences in the `pMARS` simulator version and the randomness of starting positions. In modern `pMARS` (ICWS'94), `Plague` and `Piper` often outperform `Ferret`.
