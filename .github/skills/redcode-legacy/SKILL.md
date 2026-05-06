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
3. **Preservation Check**: Ensure logic remains unchanged. Only syntax and formatting should be modified. Explain changes in comments.
4. **Validation Check**: Verify that `;assert` lines follow supported formats for automated parameter extraction. Move incompatible binaries/hex to `incompatible/`.

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
  - **Do Not Delete**: Comment out legacy code instead of removing it using `;`.
  - **Explicit Modifiers**: Use `mov.i` etc. where appropriate for clarity, but prioritize `-8` compatibility.
  - **Headers**: Ensure `;redcode-94` or appropriate version is specified in the header. Add explanatory comments for modifications (e.g., `; Modified to resolve syntax issues...`).
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
  - Ensure `;assert` lines use formats like `;assert (CORESIZE == 8000)` or `;assert CORESIZE=8000`. Use `1` instead of `TRUE` (e.g., `;assert 1`).
  - Supported parameters for extraction: `CORESIZE` (`-s`), `MAXLENGTH` (`-l`), `MAXPROCESSES` (`-p`), `MAXCYCLES` (`-c`), `MINDISTANCE` (`-d`).
- **Handling Incompatible Formats**:
  - Move warriors using hex notation (e.g., `$0FFFF`) or binary object formats (e.g., `.MOB`) to an `incompatible/` subdirectory to prevent pipeline failures.

## Historical Case Studies & Parameters

- **ICWT 1988/1989 & TI 1989**: Single-operand `DAT` updated to two-operand. Immediate values explicitly marked with `#`. `CMP/JMN` adjusted for B-field imm-restrictions.
- **KOFACOTO Round 3 (Black Box)**: Core Size: 55440, Processes: 10000, Cycles: 500000, Length: 200, Min Distance: 200. Required `assert 1` fixes.
- **KOFACOTO Round 5**: Reconstructed warriors (e.g., Ben Ford's self-modifying code) using historical components from 'Recycled Bits'. Recovered 'Round5.2000' and 'Quicksilver' from koth.org archives.
- **KOFACOTO Round 6**: Large core (55440) with extended modifiers (`-x`). Max Processes: 55440. Explicit `end <label>` required.
- **]enigma[ (Round 7)**: Non-standard `<<` addressing modes normalized to `<` for ICWS'88 compliance. Corrected `eStep 1751` for 14-1-985 tournament matching.

## What to Avoid

- **Redundant Directives**: Never use both `org` and `end` in the same file to prevent "Ignoring END" warnings.
- **Logic Alteration**: Avoid changing any functional logic (offsets, pointers, instruction types) during modernization. Adding `<0` or `#0` to a `DAT` preserves value and pointer behavior.
- **Deleting History**: Always explain why a change was made in a comment. Do not silently rewrite history.

## Related Skills

- `redcode`: For general Redcode authoring and ModelWar strategy.
- `pmars`: For simulator execution and historical parameter settings.
