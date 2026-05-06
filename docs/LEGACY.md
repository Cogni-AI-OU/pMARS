# Historical Compatibility and Case Studies

This document preserves historical context for legacy Redcode and documents findings from updating older warriors to assemble correctly in pMARS. For agentic rules on how to modify and modernize warriors, refer to `docs/redcode-legacy.md`.

## Historical Compatibility
Many historical warriors (from the 1980s and early 90s) were written for parsers that were more lenient (e.g., allowing space-separated operands or omitting the B-field).

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

### Case: ICWT 1989 and TI 1989 Warriors

The ICWT 1989 and Secondo Torneo Italiano (TI 1989) tournament sets were modernized to follow strict compatibility rules:

- **Modification Comment:** Each file includes `; Modified to resolve syntax issues and ensure compatibility with pMARS assembly in ICWS'88 mode`.
- **DAT Standardization:** All `DAT` instructions were updated to have two operands (e.g., `DAT #0, #700`).
- **Operand Formatting:** Immediate values were explicitly marked with `#`.

## ICWS '94x Large Core Compatibility

### Case: KOFACOTO Round 5 Warriors

For Round 5 of the KOFACOTO tournament, several warriors were reconstructed or recovered from historical archives:

- **Self-Modifying Code (Ben Ford):** Reconstructed using components from David Moore's 'Recycled Bits' and the P^3 brain logic from Leonardo Liporati's 'Stolen RedCode', following the historical description.
- **Recovered Warriors:** 'Round5.2000' (P. Kline), '2 Crazy' (Christian Schmidt), 'Quicksilver' (Michal Janeczek), and 'G2' (David Moore) were recovered from the web archive of koth.org.

### Case: Yeager.red (KOFACOTO Tournament)

Some tournaments, like KOFACOTO Round 6, used a large core with extended modifiers (`-x` flag in pMARS).

### Core Parameters
For KOFACOTO Round 6, the parameters were:
- **Core Size:** 55440
- **Max Processes:** 55440
- **Cycles:** 500000

When simulating these environments, ensure the `-s`, `-p`, and `-c` flags are set correctly. The `-x` flag is often required for extended modifiers, although some pMARS builds enable it by default.

### Warrior Length
Large core warriors often exceed the default length limit of 100 instructions. Use the `-l` flag to increase the limit (e.g., `-l 500`).

### P-Space
Ensure P-space size is appropriate for the core size. By default, pMARS sets it to 1/16th of the core size.

## Case Studies

### ICWT 1990 Warriors

The 1990 tournament simulation uses strict ICWS'88 mode. Warriors were updated to include commas and explicit B-operands. Explanatory comments were added to each modified file.

### Case: Entry Point Modernization (KOFACOTO Tournament)

In the KOFACOTO tournament, several warriors were updated to ensure a strict and explicit entry point. This includes warriors from Round 1, Round 2, Round 3, and Round 4.

**Example (He Scans Alone B from Round 6):**
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

**Example (Retribution.red from Round 4):**
```redcode
;redcode-94
;name Retribution
;author Michal Janeczek
...
; org    cPtr ; Removed in favor of 'end cPtr' for better compatibility
...
; Added 'end cPtr' to ensure compatibility and explicit entry point definition
      end    cPtr
```

### Case: KOFACOTO Round 3 (Black Warrior Round)
Round 3 of the KOFACOTO tournament introduced a secret opponent named **Black Box**. This round used special core settings that differ from the standard ICWS'94 Draft defaults:
- **Core Size:** 55440
- **Max Processes:** 10000
- **Max Cycles:** 500000
- **Max Warrior Length:** 200 (Requires `-l 200` flag)
- **Minimum Distance:** 200 (Requires `-d 200` flag)

#### Warrior Adjustments:
Several warriors were adjusted to satisfy modern pMARS assembly:
- **Chin.red (Voodoo):** Added `;assert 1` to avoid warnings.
- **Macrae.red (55HSB):** Changed `;assert TRUE` to `;assert 1` as `TRUE` is not a recognized constant in pMARS.
- **BlackBox.red:** The opponent warrior was included in the tournament archive to allow reproducible tests.

### Case: ]enigma[ (KOFACOTO Tournament Round 7)
The warrior `]enigma[` was found on an archive site with non-standard addressing modes (`<<`) and missing/misaligned constants. It was modernized for ICWS '88 compatibility in pMARS.
- **Addressing Modes:** Changed `<<` to `<` to comply with the ICWS '88 standard.
- **Parameters:** Identified `eStep 1751` and `-p 256` as the correct environment parameters to match the historical 14-1-985 tournament results.
- **Boot Structure:** Fixed the parallel copy boot by ensuring labels and lengths aligned with the 8-line replicated module.