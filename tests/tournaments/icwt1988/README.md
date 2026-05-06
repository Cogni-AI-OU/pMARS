# ICWT 1988 Tournament Simulation

This directory contains a simulation of the Third Annual International Core Wars Society Tournament (Dec 1988).

## Files
- `simulate.sh`: Shell script executing `pmars` to simulate the tournament rounds.
- `Makefile`: Makefile to run the simulation.

## Tournament Rules
- Standard: ICWS'86 (simulated using `pmars -8`)
- Coreset: 8192
- Processes: 64
- Cycles: 50,000
- Rounds: 3
- Points: 3 for win, 1 for tie

## Official Results
1st: [Cowboy](../../../warriors/tournaments/icwt1988/cowboy.red) by Eugene P. Lilitko
2nd: [Lux 2 T](../../../warriors/tournaments/icwt1988/lux2t.red) by Luca Crosara
3rd: [Mule DNA](../../../warriors/tournaments/icwt1988/muledna.red) by Douglas McDaniels

## Simulation Results
The simulation is conducted using the modernized warriors to ensure compatibility with `pmars -8`.
