# Legacy Redcode Compatibility and Modernization

This document tracks identified compatibility issues between historical Redcode standards (like ICWS'86 and ICWS'88) and modern `pMARS` implementations (ICWS'94 draft). It serves as a guide for modernizing legacy warriors while preserving their historical logic.

## Identified Compatibility Issues

### 1. Label Syntax
- **Colons**: Modern `pMARS` (especially with `-8` flag) may fail on labels ending with colons (e.g., `boot:`).
  - **Fix**: Remove the colon (e.g., `boot`).

### 2. Expression Parsing
- **Parentheses**: `EQU` and `FOR` expressions containing parentheses can cause assembly errors in certain `pMARS` versions or under strict standards enforcement.
  - **Fix**: Flatten expressions to remove parentheses.

### 3. Operand Formatting
- **Commas**: Many historical warriors omitted commas between operands (e.g., `MOV 0 1`).
  - **Fix**: Always use commas (e.g., `MOV 0, 1`).
- **Negative Constants**: Negative numbers (e.g., `-2793`) might be misinterpreted by some historical parsers.
  - **Fix**: Use subtraction from zero (e.g., `0-2793`).
- **Addressing Mode Spacing**: Spaces between the addressing mode character and the symbol (e.g., `< Z2`) can lead to parsing errors.
  - **Fix**: Remove the space (e.g., `<Z2`).

### 4. Symbol Management
- **Redefinition Errors**: Using the same name for an `EQU` constant and a label causes redefinition failures.
  - **Fix**: Use unique names for constants and labels.
- **Undefined Symbols**: Historical warriors sometimes relied on implicit defaults for undefined symbols.
  - **Fix**: Explicitly define symbols or replace them with defaults (e.g., `0`).

### 5. Comments and Formatting
- **Multi-line Comments**: Every line in a multi-line comment block must start with a semicolon (`;`). Missing semicolons cause the parser to attempt to execute the comment as code.
- **Single-Operand Instructions**: Instructions like `DAT`, `SPL`, `JMP`, and `DJN` often only had one operand in older standards.
  - **Fix**: Add an explicit B-operand (usually `, 0` or `, #0`) for ICWS'88 compatibility.

## Case Study: May 2026 Repository-Wide Cleanup
During a massive cleanup of ~500 tournament warriors, these fixes were applied across multiple historical sets:
- **`gbs1989`, `polski`, `IRCT`, `ti1989`, `kofacoto`**: Resolved hundreds of assembly failures by standardizing on the above rules.
- **Result**: Successfully integrated all warriors into the CI/CD assembly validation pipeline, ensuring they remain "runnable" despite their age.
