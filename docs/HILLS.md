# Hill Information

This document provides information about the Core War "Hills" available at [KOTH.org](http://www.koth.org/koth.html). 

## Summary of Hills

| Hill Name | Redcode Tag | Instruction Set | Core Size | Cycles | Max Processes | Max Length | Min Distance |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| ICWS '88 Standard | `;redcode` | ICWS '88 (`-8`) | 8000 | 80000 | 8000 | 100 | 100 |
| ICWS '94 Standard | `;redcode-94` | ICWS '94 | 8000 | 80000 | 8000 | 100 | 100 |
| ICWS '94 No Pspace | `;redcode-94nop` | ICWS '94 | 8000 | 80000 | 8000 | 100 | 100 |
| ICWS '94 Experimental | `;redcode-94x` | ICWS '94 | 55440 | 500000 | 10000 | 200 | 200 |
| ICWS '94 Multiwarrior | `;redcode-94m` | ICWS '94 | 8000 | 80000 | 8000 | 100 | 100 |
| ICWS Tournament | `;redcode-icws` | ICWS '88 (`-8`) | 8192 | 100000 | 8000 | 300 | 300 |
| ICWS '94 Multiwarrior X | `;redcode-94xm` | ICWS '94 | 55440 | 500000 | 10000 | 200 | 200 |

## Submitting Warriors

All warrior submissions should be mailed to `koth@KOTH.org`.

1. A `;redcode` (or variant) line must be at the top of your warrior's code to specify the target Hill.
2. The warrior's code must be copy/pasted into the ordinary text of an email.

### Assertion Lines

Use pMARS `;assert` options to ensure your warrior compiles correctly for the target hill.

**For ICWS '94 Experimental (`94x`) rules:**
```redcode
;assert (CORESIZE==55440) && (MAXPROCESSES==10000)
;assert (MAXCYCLES==500000) && (MAXLENGTH==200)
;assert (MINDISTANCE==200) && (PSPACESIZE==55440/16)
```

**For ICWS '88 rules:**
```redcode
;assert (CORESIZE==8000) && (MAXPROCESSES==8000)
;assert (MAXCYCLES==80000) && (MAXLENGTH==100)
;assert (MINDISTANCE==100)
```

*Note: Do not assert the number of rounds (e.g., `;assert (ROUNDS > 5)`), as this may cause pre-compilation failures on the server.*

## Server Commands

The KOTH.org server accepts several commands within the email:

- `;help` - List of commands.
- `;status` - Current status of all hills.
- `;statistics` - Current statistics of the server.
- `;test` - Compiles the warrior but does not submit it to the hill (use with a `;redcode` command).
- `;kill` - Kills a warrior on a hill (must be used with `;password`).
- `;password <password>` - Identifying password for the warrior.
- `;newpasswd <newpassword>` - Assigns a new password (must include original `;redcode`, `;name`, and `;password` lines).
- `;newredcode` - Assigns a new `;redcode` line for a warrior.
- `;url <url>` - Pointer to author's web URL.
- `;version` - Displays versions of all hill modules.

You can also add `quiet` or `verbose` to the end of a `;redcode-xxxx` line to control the amount of email feedback (e.g., `;redcode-94nop quiet`).
