# Tournament Test Standards

This directory contains simulations of historical Core War tournaments. To ensure these simulations are reliable for regression testing and continuous integration, all tournament tests MUST follow these standards.

## Deterministic Execution

Tournament results must be 100% reproducible across different runs and environments.

- **Fixed Seeds:** Always use the `-f` flag with `pmars`. This enforces a fixed series of starting positions based on a checksum, preventing variability due to random placement.
- **Fixed Parameters:** Explicitly set all environment parameters (core size `-s`, processes `-p`, cycles `-c`, rounds `-r`) in the simulation scripts or Makefiles.
- **Controlled Environment:** Ensure no external factors (like system time or uninitialized memory) influence the results.

## Output Consistency

To integrate with automated test suites, the output of a tournament simulation must be consistent.

- **Standardized Output Format:** The `simulate.sh` or `Makefile` should produce a clear, machine-readable output.
- **Regression Testing:** Tournament outputs should be consistent so they can be integrated into the test suite. If a simulation's results change, it indicates a change in the simulator's core logic or instruction behavior.

## Historical Fidelity

While deterministic results are paramount for testing, simulations should aim for historical accuracy where possible.

- **Rule Enforcement:** Use the `-8` flag for ICWS'88/86 simulations or the appropriate flags for the standard used in the historical tournament.
- **Standard Scoring:** Unless the historical tournament used a unique system, use:
    - **3 points** for a win.
    - **1 point** for a tie.
    - **0 points** for a loss.

## Directory Structure

Each tournament simulation should be in its own subdirectory under `tests/tournaments/` (e.g., `tests/tournaments/icwt1987/`). Each directory should typically contain:

1. `README.md`: Documenting the historical context and parameters.
2. `simulate.sh` or `Makefile`: The entry point for running the simulation.
3. `RESULTS.txt` (or similar): The expected deterministic output for verification (optional but recommended for automated tests).

Warriors for tournaments are generally located in the `warriors/tournaments/` directory in the repository root.
