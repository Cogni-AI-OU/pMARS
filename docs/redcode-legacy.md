# Redcode Syntax and Legacy Modernization Guide

This document defines the agentic guidelines and syntax requirements for modernizing legacy Redcode warriors in this repository, especially when using the `pMARS` strict ICWS'88 mode (`-8` flag).

## Strict ICWS'88 Syntax

To ensure compatibility with the strict ICWS'88 parser in `pMARS`, warriors MUST adhere to the following rules:

### 1. Comma Between Operands
All instructions with two operands MUST have a comma separating them.
- **Incorrect:** `MOV 0 1`
- **Correct:** `MOV 0, 1`

### 2. Explicit B-Operands
Instructions that logically take one operand (like `SPL`, `JMP`, `DJN` in some contexts) MUST still provide an explicit B-operand when running in strict mode.
- **Incorrect:** `SPL 10`
- **Correct:** `SPL 10, 0`

### 3. DAT Instruction Modes
`DAT` instructions MUST have valid prefix modes (like `#`, `<`, `$`, `@`) for their operands. In strict ICWS'88, a raw number is often interpreted as a direct address, but for `DAT` it's best to be explicit.
- **Example:** `DAT <0, <0` or `DAT #0, #0`
- **Strict:** `DAT #0, #0` (required for two operands in strict mode)

### 4. Label Case Sensitivity
Ensure that labels used in `END` or other instructions match the case of their definition.

### 5. Explicit Modifiers and Direct Addressing
While ICWS '88 used space or no character for direct addressing, modern Redcode (ICWS '94) introduced the `$` symbol for direct addressing. For maximum compatibility across different pMARS modes:
1. **Avoid `$` in ICWS '88:** If a warrior is intended for the `-8` mode, avoid using the `$` modifier. Use the naked value for direct addressing.
2. **Use `#` for Constants:** Ensure that constants used in `DAT` or as immediate operands are explicitly prefixed with `#`.

## Syntax and Directives

### Entry Point Definition
When defining the entry point of a warrior, there are two common directives: `org <label>` and `end <label>`.
- **Preferred Format:** `end <label>` at the end of the file.
- **Legacy Format:** `org <label>` at the beginning of the file (after the header).

**Consistency Rule:**
For better compatibility across different pMARS versions and consistency within tournament sets, `end <label>` is the preferred method for specifying the entry point.

**Avoid Redundancy:**
Do not use both `org` and `end` directives in the same file. Using both triggers a warning in pMARS:
`"Both opcodes ORG and END are used. Ignoring END"`

### Formatting Conventions
- **Headers:** Ensure `redcode-94` or appropriate version is specified in the header.
- **Labeling:** Use clear, consistent labels for entry points (e.g., `tStart`, `start`).
- **Modifiers:** While pMARS is permissive, using explicit modifiers (e.g., `mov.i`) is encouraged for "strict" syntax to avoid ambiguity across different simulator implementations.

## Preservation of Historical Code

When incorporating and modernizing these into the repository for simulation or testing:
1. **Preserve Logic:** Modifications should be strictly limited to syntax cleanup. Adding a comma or an explicit `0` as a B-field does not change the execution behavior in ICWS'88.
2. **DAT Evaluation:** Adding `<0` or `#0` to a `DAT` instruction preserves its value and pointer behavior.
3. **Incompatible Formats:** Warriors using incompatible syntax (like hex notation `$0FFFF` or binary object formats `.MOB`) should be moved to an `incompatible/` subdirectory to avoid breaking general assembly tests.
4. **Do Not Delete:** When removing or replacing legacy logic (like an `org` directive), comment it out instead of deleting it.
5. **Comment Character:** Use `;` for all Redcode comments.
6. **Explain Changes:** Always include a brief comment explaining why a change was made.

## Simulator Parameter Limits & Automated Assembly Validation

The project's continuous integration pipeline includes an automated step to verify that all warriors in `warriors/tournaments/` can be successfully assembled by `pmars`.

To accommodate warriors with non-standard requirements, the validation script attempts to extract core parameters from `;assert` lines in the Redcode files using the following patterns:
- `CORESIZE`: `-s <value>`
- `MAXLENGTH`: `-l <value>`
- `MAXPROCESSES`: `-p <value>`
- `MAXCYCLES`: `-c <value>`
- `MINDISTANCE`: `-d <value>`

**Example compatible `;assert` line:**
`;assert (CORESIZE == 55440) && (MAXPROCESSES == 10000)`

If an assertion fails because the required environment parameters are not provided to the assembler, ensure the `;assert` line follows one of these supported formats (e.g., `CORESIZE == 8000` or `CORESIZE=8000`).