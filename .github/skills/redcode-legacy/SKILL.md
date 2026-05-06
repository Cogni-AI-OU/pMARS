---
name: redcode-legacy
description: Enforce strict ICWS'88 syntax, entry point conventions, and preservation standards when modernizing legacy Redcode warriors.
---
# Skill: redcode-legacy

<!-- markdownlint-disable MD013 MD023 MD031 MD032 -->

Specialized guidance for modernizing legacy Redcode warriors to ensure compatibility with strict ICWS'88 assembly and project-specific validation pipelines.

## Core Process

1. **Syntax Cleanup**: Separate operands with commas and add explicit B-operands for single-logical-operand instructions.
2. **Entry Point Standardization**: Replace SOF `org <label>` with EOF `end <label>`. Comment out the old `org` directive.
3. **Preservation Check**: Ensure logic remains unchanged. Only syntax and formatting should be modified.
4. **Validation Check**: Verify that `;assert` lines follow supported formats for automated parameter extraction.

## Core Principles

- **Strict ICWS'88 (`-8` flag) Compliance**:
  - **Commas**: Mandatory between operands (`MOV 0, 1`).
  - **Explicit B-Operands**: Required for `SPL`, `JMP`, `DJN`, etc. (`SPL 10, 0`).
  - **DAT Instructions**: MUST have two operands and explicit prefix modes (`DAT #0, #0`).
  - **Naked Addresses**: Use raw numbers for direct addressing in `-8` mode; avoid `$` modifier.
  - **Immediate Operand Restrictions**: Some instructions (e.g., `CMP`, `JMN`) do not support immediate values (`#`) in the B-field in strict mode.
    - `CMP COUNT, #47` -> `CMP #47, COUNT`
    - `JMN target, #val` -> `JMP target, 0` (if condition is constant).
  - **Label Case Sensitivity**: Labels MUST match their definitions exactly in case.
- **Modernization Invariants**:
  - **Do Not Delete**: Comment out legacy code instead of removing it.
  - **Case Sensitivity**: Ensure labels match their definitions exactly.
  - **Explicit Modifiers**: Use `mov.i` etc. where appropriate for clarity, but prioritize `-8` compatibility.
  - **Headers**: Ensure `;redcode-94` or appropriate version is specified in the header.
  - **Standard Labels**: Use clear, consistent labels for entry points (e.g., `tStart`, `start`).
- **Standardization Example**:

  ```redcode
  ; org start        ; Removed in favor of 'end start'
  start mov 0 1      ; Incorrect
  mov 0, 1           ; Correct
  spl 10             ; Incorrect
  spl 10, 0          ; Correct
  dat 0              ; Incorrect
  dat #0, #0         ; Correct
  end start
  ```
- **Automated Parameter Extraction**:
  - Ensure `;assert` lines use formats like `;assert (CORESIZE == 8000)` or `;assert CORESIZE=8000` to be correctly parsed by CI.
  - Supported parameters for extraction: `CORESIZE`, `MAXLENGTH`, `MAXPROCESSES`, `MAXCYCLES`, `MINDISTANCE`.

## What to Avoid

- **Redundant Directives**: Never use both `org` and `end` in the same file.
- **Logic Alteration**: Avoid changing any functional logic (offsets, pointers, instruction types) during modernization.
- **Deleting History**: Always explain why a change was made in a comment.

## Related Skills

- `redcode`: For general Redcode authoring and ModelWar strategy.
- `pmars`: For simulator execution and historical parameter settings.
