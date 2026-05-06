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
When creating or running tournament simulations (like the ICWT 1987 simulation in `tests/tournaments/icwt1987/`), always ensure that these parameters match the historical rules as closely as possible. For detailed standards on creating and maintaining tournament tests, see [tests/tournaments/AGENTS.md](tests/tournaments/AGENTS.md).

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
- **Syntax Standards:** Adhere to strict ICWS'88 syntax for compatibility: use commas between operands, avoid colons in labels, remove parentheses from expressions, and replace negative constants (e.g., `-2793` -> `0-2793`).
- **Update Legacy Documentation:** When compatibility issues between different standards (e.g., ICWS '88 vs ICWS '94) are identified and resolved, ensure that `docs/LEGACY.md` is updated with these new findings to guide future development.
- **Assembled Listings:** For every `.red` file, a corresponding `.red.asm` file must be generated and maintained. This file contains the assembled assembly listing (generated via `pmars -A <file.red>`) and is used for automated verification in CI/CD (see `.github/workflows/test-redcode.yml`).
- **Automation Script:** Use `scripts/gen_red_asm.sh` to automate the generation of these listings. It accepts an optional directory and extra `pmars` flags.
    - Example: `bash scripts/gen_red_asm.sh warriors/88Standard "-s 8192"`

## Available Skills

This repository provides specialized GitHub skills to guide agentic behavior. Always load the relevant skill when performing specific tasks:

- **`redcode`**: General Redcode authoring, syntax, and basic strategies.
- **`redcode-legacy`**: Modernizing legacy Redcode warriors for strict ICWS'88 compatibility.
- **`redcode-icws88`**: Specific rules and idioms for the ICWS'88 standard.
- **`redcode-icws94`**: Specific rules and idioms for the ICWS'94 draft standard.
- **`pmars`**: Simulator execution, parameter setting, and standards enforcement.
- **`pmars-warrior-strategies`**: Advanced warrior design patterns (e.g., scanners, vampires).
- **`modelwar`**: Context for ModelWar specific rules and tournaments.

### Skill Maintenance
- **Update Skills with Findings:** When new compatibility issues or optimal strategies are identified (especially during PR reviews or tournament simulations), update the corresponding `SKILL.md` in `.github/skills/`.
- **Consistency:** Ensure that instructions in `AGENTS.md` and the skill files remain mutually consistent.

## Maintenance

- **Keep AGENTS.md Up-to-Date:** This file must be kept up-to-date to ensure all agents are following the most recent project standards and procedures.
- **Incorporate PR Information:** When new relevant information or patterns are established in a Pull Request (PR), this file should be updated to capture that knowledge for future tasks.

These instructions are maintained in this `AGENTS.md` file and must be followed by all agents.
