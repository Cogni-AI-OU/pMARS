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

## Historical Compatibility
Many historical warriors (from the 1980s and early 90s) were written for parsers that were more lenient (e.g., allowing space-separated operands or omitting the B-field). 

When incorporating these into the repository for simulation or testing:
1. **Preserve Logic:** Modifications should be strictly limited to syntax cleanup. Adding a comma or an explicit `0` as a B-field does not change the execution behavior in ICWS'88.
2. **DAT Evaluation:** Adding `<0` or `#0` to a `DAT` instruction preserves its value and pointer behavior.
3. **Incompatible Formats:** Warriors using incompatible syntax (like hex notation `$0FFFF` or binary object formats `.MOB`) should be moved to an `incompatible/` subdirectory to avoid breaking general assembly tests.

## Continuous Integration
The CI pipeline runs assembly validation on various warriors. Adhering to the strict syntax ensures that these tests pass across all environments.
