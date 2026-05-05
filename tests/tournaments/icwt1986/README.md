# ICWT 1986 Tournament Simulation

This directory contains the simulation scripts for the First International Core War Tournament (1986).

## Overview

According to historical records from [corewar.co.uk/icwt1986.htm](https://corewar.co.uk/icwt1986.htm):
- **Format**: 31 entries, top 4 from two round-robin groups went to finals. The 8 finalists fought a round-robin final (4 rounds in a 4000-cell core, max 20000 cycles). The top three then entered a playoff.
- **Top 8 Finalists**:
  1. Mice (Chip Wendell)
  2. Chang1 (Morrison J. Chang)
  3. Midget (Chip Wendell)
  4. Commando (A. K. Dewdney)
  4. Locust (Mark Clarkson)
  4. Parasite (Norio Suzuki)
  7. Facta Non Verba (Michael Giberson)
  8. MiniD (Mark Clarkson)

## Running the Simulation

You can run the simulation using `make`:

```sh
make test
```

Or by directly executing the bash script:

```sh
bash simulate.sh
```

## Note on Compatibility

The simulation approximates the ICWS'86 rules using pMARS's `-8` (ICWS'88) flag with a 4000-cell core size and 20000 cycles per round. Due to differences between pMARS and the original 1986 simulator (including the instruction execution order, `SPL` behavior, ties handling, and process limits), the exact standings may occasionally vary from the historical outcome, but the top contenders remain highly competitive.