---
name: pmars
description: Compile, configure, and execute the pMARS Core War simulator, managing simulation parameters, standards enforcement, and tournament automation.
---
# Skill: pmars

<!-- markdownlint-disable MD013 MD023 MD031 MD032 -->

Expert-level guidance for managing the pMARS (Portable Memory Array Redcode Simulator) lifecycle, including compilation, execution flags, and environment standardization for Core War tournaments.

## Core Process

1.  **Build Selection**: Navigate to `src/` and choose a target (e.g., `make default` for cdb debugger, `make server` for CLI-only).
2.  **Environment Setup**: Define core size (`-s`), max processes (`-p`), and cycles (`-c`) based on the target tournament or standard.
3.  **Standard Selection**: Use `-8` for ICWS'88 strict compliance or rely on default ICWS'94 behavior.
4.  **Verification**: Execute `./pmars` to verify the build and run initial matches.

## Core Principles

-   **Deterministic Simulation**: Always use the `-f` flag for reproducible results in tournaments; it enforces fixed starting positions based on a checksum.
-   **Standard Enforcement**:
    -   `-8`: Enforces ICWS'88 rules (disables P-space, MUL/DIV/MOD, etc.). This is the primary mode for ICWS'86/88 historical simulations.
    -   **Default**: ICWS'94 draft standard.
-   **Resource Bounds**: Maximize simulator efficiency by tuning `-p` (processes) and `-c` (cycles) to the minimum required by the tournament rules.
-   **Scoring Consistency**: Standard system: 3 pts (Win), 1 pt (Tie), 0 pts (Loss).

## Commands / Usage Patterns

### Compilation Targets (in `src/`)
- **Standard (cdb)**: `make default`
- **CLI/Server**: `make server`
- **Visuals**: `make curses`, `make sdl`, or `make xwin`
- **Optimization**: `make smallmem`

### Execution Parameters
- **Historical (ICWT 1987)**: `pmars -8 -s 8192 -p 64 -c 50000 -r 3 -f <warrior1.red> <warrior2.red>`
- **Modern (ModelWar 1v1)**: `pmars -s 25200 -p 25200 -c 252000 -l 5040 -f <warrior1.red> <warrior2.red>`
- **Debugging**: Use `pmars` with `cdb` (if compiled with debugger) for instruction-level stepping.

## Diagnostics and Troubleshooting

-   **Build Failures**: Ensure build dependencies (X11 for `xwin`, SDL for `sdl`, ncurses for `curses`) are installed. Use `make clean` before switching targets.
-   **Non-Deterministic Results**: Verify `-f` is present. Without it, starting positions vary, making tournament results inconsistent.
-   **Parser Errors**: If a warrior fails to load, check if `-8` is incorrectly applied to an ICWS'94 warrior (e.g., using `SPL 1, 2` without commas or B-fields).

## What to Avoid

-   **Manual Result Parsing**: Use the output of `pmars` directly or pipe to automated scoring scripts; do not rely on visual inspection of the core for tournament tallies.
-   **Standard Mismatch**: Never simulate ICWS'94 warriors with the `-8` flag; the simulator will reject modern opcodes and addressing modes.

## Limitations

-   `pMARS` strict `-8` mode is the closest to ICWS'86 but may still have subtle timing differences due to modern process queue handling.
-   Graphics modes (`sdl`, `xwin`) require a display environment and will fail in headless CI/CD runners.
