---
name: redcode-icws88
description: Reference and implement ICWS '88 standard Redcode addressing modes, instruction set, effective address calculations, and execution phase logic.
---
# Skill: redcode-icws88

<!-- markdownlint-disable MD013 MD023 MD031 MD032 -->

Expert-level guidance for the ICWS '88 standard Redcode language. Focuses strictly on ICWS '88 memory model, instruction execution phases, addressing modes, and pseudo-instructions.

## Core Process

1. **Verify Instruction Set**: Ensure only ICWS '88 opcodes (`DAT`, `MOV`, `ADD`, `SUB`, `JMP`, `JMZ`, `JMN`, `CMP`, `SLT`, `DJN`, `SPL`) are used.
2. **Apply Addressing Modes**: Ensure strict use of Immediate (`#`), Direct (default), Indirect (`@`), or Predecrement-indirect (`<`).
3. **Follow Address Calculation**: Evaluate 'A' operand (including pointer decrements for `<`), then 'B' operand, before opcode execution.
4. **Queue Management**: Verify process queue behavior, especially for `SPL` (parent queued before child) and `DAT` (process removed).

## Core Principles

- **MARS Memory Model**: RAM is a circular list; relative addressing means `0` refers to the current instruction. Uninitialized RAM defaults to `DAT 0 0`.
- **Addressing Normalization**: Before the opcode executes, operands are normalized to absolute addresses. If `<` (predecrement-indirect) is used, the B-field of the pointer is decremented in memory *before* being evaluated as an offset.
- **Queue FIFO Dynamics**: During `SPL A B`, the current process's PC is incremented and placed at the back of the queue, followed by the spawned process `A`.
- **Source Syntax Rules**: 
  - Labels must start in column 1 (first 8 characters significant).
  - Operands consist of an addressing mode and an expression (`+`, `-`, `*`, `/`).
  - Pseudo-instructions: `EQU` assigns value to a label. `END` defines the end of file and an optional entry point.

## Commands / Usage Patterns

- **Math Operations**: `ADD A B` / `SUB A B` apply to both A-field and B-field if the 'A' operand is non-immediate. If 'A' is immediate, they apply only to the B-field.
- **Comparisons**: `CMP A B` compares the entire memory location if 'A' is non-immediate. If immediate, it compares against the B-field. `SLT A B` compares B-fields if non-immediate, or 'A' value against B-field if immediate.
- **Movement**: `MOV A B` moves the entire memory location if 'A' is non-immediate, or places data into the B-field if 'A' is immediate.

## Execution Rules (Phase order)

1. **Fetch & Normalization**: 
   - A-operand evaluated first. If `<` mode is used, target memory's B-field is decremented and rewritten.
   - B-operand evaluated next, following the same indirection and decrement rules.
2. **Opcode Processing**: Opcode executes using the fully resolved absolute addresses.
3. **Queue Updating**: For non-branching/non-DAT instructions, PC is incremented and pushed to the back of the FIFO queue.

## What to Avoid

- **Using ICWS '94 Additions**: Never use `SEQ`, `SNE`, `NOP`, `LDP`, `STP`, `MUL`, `DIV`, `MOD`, or addressing modes like post-increment (`>`), A-field indirect (`*`, `{`, `}`), or explicit `.A`/`.B`/`.AB` modifiers.
- **Misunderstanding SPL Queue Order**: Do not assume the spawned process executes before the parent's next instruction.
- **Using Uninitialized Labels**: Labels used in `EQU` must be defined previously.
- **Syntax Errors**: Do not indent labels. Do not use more than 8 significant characters for a label.

## Limitations

- This standard lacks modern constructs like P-Space, variables, or macro preprocessors.
- Only A and B operand fields exist; memory locations act simultaneously as code and data.

## Related Skills

- `redcode`: General Core War strategies, modern (ICWS '94) syntax, and `-8` strict mode parser workarounds.
- `pmars`: Simulator configuration and `-8` flag enforcement.
