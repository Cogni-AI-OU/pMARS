---
name: redcode-icws94
description: Write, analyze, optimize, or modernize Redcode assembly programs adhering to the ICWS '94 standard, utilizing modifiers and P-space.
---
# Skill: redcode-icws94

<!-- markdownlint-disable MD013 MD023 MD031 MD032 -->

Expert-level guidance for authoring, analyzing, and modernizing Redcode assembly for Core War, specifically targeting the ICWS '94 standard and pMARS extended capabilities.

## Core Process

1. **Leverage Modifiers**: Apply instruction modifiers (`.A`, `.B`, `.AB`, `.BA`, `.F`, `.X`, `.I`) to dictate precise execution paths and memory manipulation.
2. **Utilize Advanced Addressing**: Exploit ICWS '94 addressing modes including A-field indirect (`*`), predecrement (`{`), postincrement (`}`), and B-field equivalents (`@`, `<`, `>`).
3. **Implement P-Space State**: Manage state across multiple rounds using `LDP` (Load P-Space) and `STP` (Store P-Space).
4. **Employ Extended Opcodes**: Utilize math and flow control opcodes added in '94 such as `MUL`, `DIV`, `MOD`, `SEQ`, `SNE`, and `NOP`.

## Core Principles

- **Modifiers Dictate Action**: Without an explicit modifier, standard conversion rules apply based on operands. Explicitly specify `.I` for instruction copies or `.F` for full field copies.
- **Silk Replication**: Exploit ICWS '94 postincrement modes for single-instruction parallel copying: `SPL @paper, step` followed by `MOV.I }paper, >paper`.
- **P-Space (State)**: Use `LDP`/`STP` to load/store state across rounds. Cell 0 holds the prior round's outcome (0=loss, 1=win, 2=tie).
- **Default Modifier Rules**: When a modifier is omitted, the assembler appends a default modifier based on the opcodes and addressing modes (e.g., `MOV #0, 1` defaults to `MOV.AB #0, 1`).

## Commands / Usage Patterns

- **Compile/Simulate ICWS '94**: `pmars -s 8000 -p 8000 -c 80000 -r 100 -f <warrior.red>` (Note: pMARS defaults to '94 standard).
- **Assertion Macro**: Use `;assert 1` or `;assert (CORESIZE == 8000)` to specify compatibility and prevent invalid execution.
- **P-Space Persistence**: 
  `LDP #0, #0` (load round result)
  `STP #1, #0` (store state)

## Diagnostics and Troubleshooting

- **Divide by Zero**: Ensure `DIV` or `MOD` operations do not divide by zero. In ICWS '94, division by zero kills the current process.
- **Modifier Mismatch**: Using an inappropriate modifier (e.g., `.I` on math operations) may yield unintended results. Stick to `.AB`, `.B`, or `.F` for math.
- **Missing Modifiers**: If code behaves unexpectedly, check if the assembler's default modifier matches the intended operation.

## What to Avoid

- **Legacy Syntax Mix**: Avoid mixing legacy ICWS '88 strict constraints (like comma enforcement or missing modifiers) if taking full advantage of the '94 standard, to maintain clean modern code.
- **Overwriting P-Space**: P-space is persistent; avoid overwriting state data without explicit intent, especially location 0 (read-only round result).

## Related Skills

- `pmars`: For simulator configuration, compilation, and execution parameters.
- `redcode`: For ICWS '88 legacy standards and conversions.