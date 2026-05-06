# pMARS Agent Guidelines

## Simulator Standards and Parameters

When simulating different Core War standards or historical environments, use the following `pMARS` parameters:

### Enforcing Standards
- `-8`: Enforce **ICWS'88** rules. This restricts the assembler to opcodes and addressing modes defined in the 1988 standard and sets the simulator to 1988-compliant behavior. This is the closest mode available for simulating **ICWS'86** environments.
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
