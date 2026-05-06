# AGENTS.md

## Compilation Instructions

To compile pMARS, follow these steps:

1.  **Navigate to the source directory:**
    ```bash
    cd src
    ```

2.  **Run the build command:**
    Choose the build target that suits your needs:
    -   **Standard Build (with cdb debugger):**
        ```bash
        make default
        ```
    -   **Server Build (no debugger):**
        ```bash
        make server
        ```
    -   **Curses Display Build:**
        ```bash
        make curses
        ```
    -   **SDL Graphics Build:**
        ```bash
        make sdl
        ```
    -   **X Windows Graphics Build:**
        ```bash
        make xwin
        ```
    -   **Small Memory Build:**
        ```bash
        make smallmem
        ```

3.  **Clean up build artifacts (optional):**
    ```bash
    make clean
    ```

## Verification

After compilation, you should find the `pmars` executable in the `src` directory. You can verify it by running:
```bash
./pmars
```

## Simulator Standards and Parameters

When simulating different Core War standards or historical environments, use the following `pMARS` parameters:

### Enforcing Standards
- `-8`: Enforce **ICWS'88** rules. This restricts the assembler to only allow opcodes and addressing modes defined in the 1988 standard (e.g., no `MUL`, `DIV`, `MOD`, `P-space`, or extended modifiers). This sets the simulator to 1988-compliant behavior and is the closest mode available for simulating **ICWS'86** environments.
- By default, `pMARS` uses the **ICWS'94** draft standard.

### Environment Parameters
- `-s <size>`: Set the core size (e.g., `-s 8192` for ICWT 1987).
- `-p <max_processes>`: Limit the maximum number of processes (e.g., `-p 64`).
- `-c <cycles>`: Set the maximum number of cycles until a tie is declared (e.g., `-c 50000`).
- `-r <rounds>`: Specify how many rounds to play in a match (e.g., `-r 3`).

### Deterministic Results
- `-f`: Enforce a fixed starting position series based on a checksum. This is essential for reproducible tournament simulations and ensures that results are consistent across runs.

## Tournament Simulations
When creating or running tournament simulations (like the ICWT 1987 simulation in `tests/tournaments/icwt1987/`), always ensure that these parameters match the historical rules as closely as possible.

### Standard Scoring
For consistency with historical tournaments, use the following point system unless the tournament rules specify otherwise:
- **3 points** for a win.
- **1 point** for a tie.
- **0 points** for a loss.

### Example Simulation Command
To run a match between two warriors using ICWT 1987 historical parameters and ICWS'88 rules:
```bash
pmars -8 -s 8192 -p 64 -c 50000 -r 3 -f warrior1.red warrior2.red
```

### Interpretation of Results
Note that simulation results using modern `pMARS` may differ from historical outcomes (e.g., ICWT 1987) due to differences between the ICWS'86 standard and modern implementations, even when using the `-8` flag. Discrepancies often arise from scanner sensitivity to timing and process handling.

## Redcode (.red) File Conventions

To preserve the history and context of warrior development:
- **Do not delete code:** When removing logic from `.red` files, comment it out instead of deleting it.
- **Explain changes:** Always include a comment explaining the reason for the modification or why the code was commented out.
- **Comment character:** Use `;` for comments in Redcode files.

These instructions are maintained in this `AGENTS.md` file and must be followed by all agents.
