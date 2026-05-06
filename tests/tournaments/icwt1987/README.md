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
The simulation results differ from the historical results (Ferret 1st, Plague 2nd, Piper 3rd) when using the modern `pMARS` built from this repository's source. In this simulation, `Piper` and `Plague` consistently outperform `Ferret`.

### Reasons for Discrepancy:
1. **Simulator Standard:** ICWT 1987 used the ICWS'86 standard. While `pMARS -8` enforces the ICWS'88 standard, there are subtle differences in instruction behavior (especially `CMP` and `SPL`) and timing between the original 1986 simulators and modern `pMARS`.
2. **Scanner Sensitivity:** Linear scanners like `Ferret` are highly sensitive to the initial distance between warriors and the exact implementation of the simulator's process queue and comparison logic.
3. **Deterministic Seed:** The simulation uses the `-f` flag for reproducibility, but the fixed starting positions may favor certain strategies over others compared to the random positions used in the original tournament.
