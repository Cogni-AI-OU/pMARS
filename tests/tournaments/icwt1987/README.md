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
1. **Simulator Standard:** ICWT 1987 used the ICWS'86 standard. While `pMARS -8` enforces the ICWS'88 standard, modern `pMARS` is highly "over-compliant" and sensitive. It uses `CMP.I` for instruction comparison, whereas older simulators were often less sensitive (sometimes only comparing B-fields).
2. **Scanner False Positives:** `Ferret` is a linear scanner that uses its own instructions as a reference. In `pMARS`, the self-modifying nature of its pointers causes `CMP.I` to trigger false positives, leading `Ferret` to bomb itself or core areas it has already scanned.
3. **Core Initialization:** `pMARS` initializes core with `DAT.F 0, 0`, which may differ from the `DAT #0` or raw `0` initialization used in 1987, affecting scanners that rely on exact instruction comparison.
4. **Warrior Evolution:** Modern optimized warriors like `Plague` (step scanner) and `Piper` (vampire) perform exceptionally well in a cycle-accurate simulator like `pMARS`, often outpacing the slower linear scan of `Ferret`.
5. **Deterministic Seed:** The simulation uses the `-f` flag for reproducibility. The specific starting positions in the fixed series may favor certain strategies (like multi-process clears) over others.
