# pMARS Agent Guidelines

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
Note that simulation results using modern `pMARS` may differ from historical outcomes (e.g., ICWT 1987) due to differences between the ICWS'86 standard and modern implementations, even when using the `-8` flag.

Specific reasons for discrepancies include:
- **Instruction Sensitivity:** In `-8` mode, `pMARS` uses `CMP.I`, which compares the entire instruction (opcode, modes, fields). Historical simulators were often less sensitive (e.g., only comparing B-fields), which significantly affects scanners like **Ferret**.
- **Process Queue Handling:** Differences in how `SPL` traps and the process queue are managed can favor multi-process warriors or vampires over single-process scanners.
- **Core Initialization:** Modern `pMARS` initializes the core with `DAT.F 0, 0`, while older simulators might have used `DAT #0`. This mismatch in addressing modes can cause false positives for scanners using instruction comparison.
- **Scanner Speed:** Warriors like **Plague** use optimized step-scanning which can find and eliminate linear scanners like **Ferret** faster in a cycle-accurate modern simulator than in historical environments.
