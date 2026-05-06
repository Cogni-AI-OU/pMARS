---
name: redcode
description: Write, analyze, optimize, or modernize Redcode assembly programs for Core War, adhering strictly to ICWS '88 syntax and legacy standards.
---
# Skill: redcode

<!-- markdownlint-disable MD013 MD023 MD031 MD032 -->

Expert-level guidance for authoring, analyzing, and modernizing Redcode assembly for Core War, targeting pMARS simulator compliance in ICWS '88 strict mode.

## Core Process

1. **Identify Standard**: Verify the target is ICWS '88 (legacy/strict).
2. **Apply Syntax Rules**: Enforce strict pMARS compatibility for legacy `-8` mode.
3. **Calculate Constants**: Compute coprime optima step sizes and valid imp spiral spacings based on the specific core size (e.g., 8,000).
4. **Preserve History**: When modernizing legacy warriors, comment out old logic (`org <label>`) rather than deleting, and append `end <label>`.

## Core Principles

- **Strict ICWS '88 (`-8` flag) Syntax**:
  - **Commas**: Always separate operands (`MOV 0, 1`).
  - **Explicit B-Operands**: Single-logical-operand instructions require a B-field (`SPL 10, 0`).
  - **Explicit DAT Modes**: `DAT` needs prefix modes and two operands (`DAT #0, #0`).
  - **Addressing**: Avoid `$` in ICWS '88. Always use `#` for immediate constants.
- **Entry Points**: Prefer `end <label>` at EOF over legacy `org <label>` at SOF. Never use both.
- **Mathematical Topology**: Treat the core as `Z/CZ` (modulo CORESIZE). Step sizes must be coprime to CORESIZE (avoid divisibility by prime factors of CORESIZE).
- **Process Dynamics**: SPL creates parallel processes but dilutes speed. SPL bombs paralyze opponents by filling the queue.
- **Metagame (Rock-Paper-Scissors)**: Bombers (tiny, fast) > Scanners (detectors) > Replicators (exponential resilience) > Bombers.

## Commands / Usage Patterns

- **Compile/Simulate ICWS '88 Strict**: `pmars -8 -s 8192 -p 64 -c 50000 -r 3 -f <warrior.red>`
- **Metadata Assertions**: Use `;assert (CORESIZE == 8000)` to specify required simulator bounds.

## Diagnostics and Troubleshooting

- **`Both opcodes ORG and END are used`**: Remove `org` and keep `end <label>` at the EOF.
- **Parse Errors in `-8` mode**: Check for missing commas, missing B-fields in `SPL`/`JMP`, or naked `DAT` values. Add `#` to `DAT` operands.
- **Suboptimal Coverage**: If a bomber repeatedly hits its own bombs or misses core sections, the step size shares a common divisor with CORESIZE. Recalculate GCD(step, CORESIZE) = 1.
- **Tie-prone Warriors**: Add an imp spiral launch (e.g., `MOV 0, 1`) to the death sequence to convert certain losses into ties.

## What to Avoid

- **Blindly Porting Constants**: Never use step sizes (e.g., 3044) or imp spacings (e.g., 2667) for a different core size without recalculating modular relationships.
- **Deleting Legacy Code**: When fixing legacy syntax, comment out the old instruction (`;`) and write the correct one.
- **Self-Bombing**: Always ensure bomb patterns and step sizes skip the warrior's own code range.

## Limitations

- `pMARS` strict parser `-8` deviates from ICWS '94 defaults, enforcing older behavior which might require specific flag configurations.
- Re-calculating optima numbers is mandatory when core sizes scale.

## Related Skills

- `pmars`: For simulator configuration, compilation, and execution parameters.
- `shell`: For orchestrating `pmars` batch simulations.
- `c`: For understanding `pMARS` simulator internals if debugging core execution.
