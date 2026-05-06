# Redcode Syntax and Compatibility Guide

This document clarifies the syntax requirements for warriors in this repository, especially when using the `pMARS` strict ICWS'88 mode (`-8` flag).

## Strict ICWS'88 Syntax

To ensure compatibility with the strict ICWS'88 parser in `pMARS`, warriors should adhere to the following rules:

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

### 4. Label Case Sensitivity
Ensure that labels used in `END` or other instructions match the case of their definition.

## Entry Point Definition

When defining the entry point of a warrior, there are two common directives: `org <label>` and `end <label>`.

- **Preferred Format:** `end <label>` at the end of the file.
- **Legacy Format:** `org <label>` at the beginning of the file (after the header).

**Consistency Rule:**
For better compatibility across different pMARS versions and consistency within tournament sets, `end <label>` is the preferred method for specifying the entry point.

**Avoid Redundancy:**
Do not use both `org` and `end` directives in the same file. Using both triggers a warning in pMARS:
`"Both opcodes ORG and END are used. Ignoring END"`

## Historical Compatibility
Many historical warriors (from the 1980s and early 90s) were written for parsers that were more lenient (e.g., allowing space-separated operands or omitting the B-field). 

When incorporating these into the repository for simulation or testing:
1. **Preserve Logic:** Modifications should be strictly limited to syntax cleanup. Adding a comma or an explicit `0` as a B-field does not change the execution behavior in ICWS'88.
2. **DAT Evaluation:** Adding `<0` or `#0` to a `DAT` instruction preserves its value and pointer behavior.
3. **Incompatible Formats:** Warriors using incompatible syntax (like hex notation `$0FFFF` or binary object formats `.MOB`) should be moved to an `incompatible/` subdirectory to avoid breaking general assembly tests.

## Case Studies

### ICWT 1989 Warriors
The ICWT 1989 tournament set was modernized to follow these strict compatibility rules:
- **Modification Comment:** Each file includes `; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode`.
- **DAT Standardization:** All `DAT` instructions were updated to have two operands (e.g., `DAT #0, #700`).
- **Operand Formatting:** Immediate values were explicitly marked with `#`.

### ICWT 1990 Warriors
The 1990 tournament simulation uses strict ICWS'88 mode. Warriors were updated to include commas and explicit B-operands. Explanatory comments were added to each modified file.

### KOFACOTO Tournament
In the KOFACOTO tournament, several warriors were updated to ensure a strict and explicit entry point.
- **Yeager.red:** Replaced `org` with `end` directive.
- **Black Box (Round 3):** Used special core settings (55440 core, 10000 processes).

## Preservation of Historical Code
As per the project's core mandates in `AGENTS.md`, historical code must be preserved even when modernizing syntax for compatibility.
1. **Do Not Delete:** When removing or replacing legacy logic, comment it out instead of deleting it.
2. **Comment Character:** Use `;` for all Redcode comments.
3. **Explain Changes:** Always include a brief comment explaining why a change was made.
