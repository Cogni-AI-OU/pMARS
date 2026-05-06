# KOFACOTO Tournament Tests

This directory contains simulations for the KOFACOTO (KotH Fall Corewar Tournament) held in 2000.

## Round 7: Finals

The finals were a match between Robert Macrae's `LaterAtNight` and Michal Janeczek's `]enigma[`.

### Historical Parameters
- Rules: Standard '88 (`-8`)
- Core size: 8000 (`-s 8000`)
- Max processes: 8 (`-p 8`)
- Cycles: 80000 (`-c 80000`)
- Rounds: 1000 (`-r 1000`)
- Warrior length: 100 (`-l 100`)
- Max distance: 100 (`-d 100`)

### Historical Results
- `LaterAtNight` by Robert Macrae: 14 wins, 985 ties, 1 loss (1027 points)
- `]enigma[` by Michal Janeczek: 1 win, 985 ties, 14 losses (988 points)

## Usage

To run the tests:
```bash
make test
```
