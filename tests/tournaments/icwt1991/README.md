# ICWT 1991 Tournament Simulation

This directory contains a simulation of the 1991 International Core War Tournament (ICWT '91).

## Tournament Details

- **Standard:** ICWS'88 (strict mode)
- **Coresize:** 8192
- **Processes:** 64
- **Cycles:** 100,000
- **Rounds:** 2 per match
- **Format:** Round-robin with self-fights
- **Scoring:** 3 points per win, 1 point per tie

## Participants

The official tournament had 16 participants. This simulation uses the subset of warriors available in the repository:

1. **XTC** by Stefan Röttger (Official Rank: 1)
2. **Vlad** by David Bofinger & T. J. Allen (Official Rank: 3)
3. **Quarter** by Stefan Hänßgen (Official Rank: 5)
4. **DAC** by Mark A. Durham (Official Rank: 13)

## Running the Simulation

To run the simulation, ensure `pMARS` is compiled in the `src` directory and execute:

```bash
make test
```

## Results

Official results and historical data can be found in `warriors/tournaments/icwt1991/RESULTS.md`.
Simulation results may vary slightly from historical records due to initial placement randomization and pMARS version differences.
