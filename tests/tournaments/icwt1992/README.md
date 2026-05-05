# ICWT 1992 Tournament Simulation

This directory contains a simulation of the ICWS Tournament '92 (Dec 1992).

## Files
- `simulate.sh`: Shell script executing `pmars` to simulate the tournament rounds.
- `Makefile`: Makefile to run the simulation.

## Tournament Rules
- Standard: CWS'88
- Coresize: 8192
- Processes: 8000
- Entry length: 300
- Cycles: 100000
- Rounds: 2
- Format: Round robin
- Points: 3 for win, 1 for tie

## Official Results
1st: Return of the Living Dead 2.2 by Nándor Sieben
1st: Leprechaun 1b by Anders Ivner
3rd: Griffin 2 by Anders Ivner
3rd: Twimp by Monika Keindl
5th: Imprimis 8192 by P. Kline
6th: Plasma by Wayne Sheppard
7th: Antibody by Nándor Sieben
8th: NS6 by Lorenzo Jorquera

## Simulation Results
The simulation uses a fixed seed (`1992`) to ensure deterministic results.
While historical scores may vary due to missing competitors (only 4 of 8 finalists are currently available), the simulation correctly identifies `rotld22.red` (Return of the Living Dead 2.2) as a top-performing warrior, consistent with the official results.
