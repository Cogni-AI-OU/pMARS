# Legacy Redcode and Syntax Compatibility

This document outlines the conventions and rules for handling legacy Redcode files, ensuring compatibility with the pMARS simulator while preserving historical context.

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

## ICWS '88 Compatibility

When working with legacy Redcode designed for the ICWS '88 standard, certain adjustments are often required to ensure they assemble correctly in pMARS (especially when using the `-8` flag).

### DAT Operand Requirements

In strict ICWS '88 mode, the `DAT` opcode may require two explicit operands even if only one was historically used.

- **Legacy:** `DAT 0`
- **Strict:** `DAT #0, #0`

### Explicit Modifiers and Direct Addressing

While ICWS '88 used space or no character for direct addressing, modern Redcode (ICWS '94) introduced the `$` symbol for direct addressing. For maximum compatibility across different pMARS modes:

1. **Avoid `$` in ICWS '88:** If a warrior is intended for the `-8` mode, avoid using the `$` modifier. Use the naked value for direct addressing.
2. **Use `#` for Constants:** Ensure that constants used in `DAT` or as immediate operands are explicitly prefixed with `#`.

### Case: ICWT 1989 Warriors

The ICWT 1989 tournament set was modernized to follow these strict compatibility rules:

- **Modification Comment:** Each file includes `; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode`.
- **DAT Standardization:** All `DAT` instructions were updated to have two operands (e.g., `DAT #0, #700`).
- **Operand Formatting:** Immediate values were explicitly marked with `#`.

## Preservation of Historical Code

As per the project's core mandates in `AGENTS.md`, historical code must be preserved even when modernizing syntax for compatibility.

1. **Do Not Delete:** When removing or replacing legacy logic (like an `org` directive), comment it out instead of deleting it.
2. **Comment Character:** Use `;` for all Redcode comments.
3. **Explain Changes:** Always include a brief comment explaining why a change was made (e.g., "Removed in favor of 'end tStart' for better compatibility").

## Examples

### Case: Yeager.red (KOFACOTO Tournament)

In the KOFACOTO tournament, several warriors were updated to ensure a strict and explicit entry point.

**Before:**
```redcode
;redcode-94
;name He Scans Alone B
...
org tStart
...
tStart mov <tDecoy+0,{tDecoy+2
...
```

**After (Consistent & Compatible):**
```redcode
;redcode-94
;name He Scans Alone B
...
; org       tStart ; Removed in favor of 'end tStart' for better compatibility
...
tStart mov <tDecoy+0,{tDecoy+2
...
; Added 'end tStart' to ensure compatibility and explicit entry point definition
          end    tStart
```

This approach maintains the historical `org` directive as a comment while providing the preferred `end` directive for the simulator.

### Case: ]enigma[ (KOFACOTO Tournament Round 7)

The warrior `]enigma[` was found on an archive site with non-standard addressing modes (`<<`) and missing/misaligned constants. It was modernized for ICWS '88 compatibility in pMARS.

- **Addressing Modes:** Changed `<<` to `<` to comply with the ICWS '88 standard.
- **Parameters:** Identified `eStep 1751` and `-p 256` as the correct environment parameters to match the historical 14-1-985 tournament results.
- **Boot Structure:** Fixed the parallel copy boot by ensuring labels and lengths aligned with the 8-line replicated module.

