#!/bin/bash
# scripts/verify_red_asm.sh
# Verifies that .red.asm files are in sync with .red files

EXIT_CODE=0
PMARS_EXEC="src/pmars"

if [ ! -f "$PMARS_EXEC" ]; then
    echo "Error: $PMARS_EXEC not found. Please compile pMARS in the src directory first."
    exit 1
fi

# Find all .red.asm files
ASM_FILES=$(find . -name "*.red.asm")

if [ -z "$ASM_FILES" ]; then
    echo "No .red.asm files found to verify."
    exit 0
fi

for asm in $ASM_FILES; do
    red="${asm%.asm}"
    
    if [ ! -f "$red" ]; then
        echo "::error file=$asm::Corresponding .red file not found: $red"
        EXIT_CODE=1
        continue
    fi
    
    # Auto-detect flags from .red file
    FLAGS=""
    
    # Check for ;assert CORESIZE==...
    CORESIZE=$(grep -i ";assert" "$red" | grep -oiP "CORESIZE\D+\K\d+" | head -n 1 || echo "")
    if [[ "$CORESIZE" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -s $CORESIZE"
    fi

    # Check for ;assert MAXPROCESSES==...
    MAXPROCESSES=$(grep -i ";assert" "$red" | grep -oiP "MAXPROCESSES\D+\K\d+" | head -n 1 || echo "")
    if [[ "$MAXPROCESSES" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -p $MAXPROCESSES"
    fi

    # Check for ;assert MAXLENGTH==... or MAXINST==
    MAXLENGTH=$(grep -i ";assert" "$red" | grep -oiP "MAXLENGTH\D+\K\d+" | head -n 1 || echo "")
    if [[ ! "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        MAXLENGTH=$(grep -i ";assert" "$red" | grep -oiP "MAXINST\D+\K\d+" | head -n 1 || echo "")
    fi
    if [[ "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -l $MAXLENGTH"
    fi

    # Check for ;assert MAXCYCLES==...
    MAXCYCLES=$(grep -i ";assert" "$red" | grep -oiP "MAXCYCLES\D+\K\d+" | head -n 1 || echo "")
    if [[ "$MAXCYCLES" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -c $MAXCYCLES"
    fi

    # Check for ;assert MINDISTANCE==...
    MINDISTANCE=$(grep -i ";assert" "$red" | grep -oiP "MINDISTANCE\D+\K\d+" | head -n 1 || echo "")
    if [[ "$MINDISTANCE" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -d $MINDISTANCE"
    fi
    
    # Check for ;pmars-flags:
    FILE_FLAGS=$(grep -i ";pmars-flags:" "$red" | sed 's/.*;pmars-flags://I')
    if [ -n "$FILE_FLAGS" ]; then
        FLAGS="$FLAGS $FILE_FLAGS"
    fi
    
    # Directory based defaults if not already set
    if [[ "$red" == *"warriors/94Nano"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 80"
        [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 80"
    elif [[ "$red" == *"warriors/94tiny"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 800"
        [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 800"
    elif [[ "$red" == *"warriors/94LP"* ]]; then
        [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 500"
    elif [[ "$red" == *"warriors/88Standard"* && ! "$FLAGS" == *"-s "* ]]; then
        # Default for 88 is often 8000, but some need 8192.
        : 
    elif [[ "$red" == *"warriors/88Tourney"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 8192"
        # Fingerprint needs more length
        if [[ "$red" == *"fingerprint.red" ]]; then
             [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 300"
        fi
    elif [[ "$red" == *"warriors/tournaments/ebs1991"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 8192"
        [[ "$FLAGS" == *"-8"* ]] || FLAGS="$FLAGS -8"
    fi

    # Ensure MAXLENGTH and MINDISTANCE don't exceed CORESIZE if set
    CURRENT_CS=$(echo "$FLAGS" | grep -oiP "\-s\s+\K\d+" | head -n 1 || echo "")
    if [[ -n "$CURRENT_CS" ]]; then
        CURRENT_ML=$(echo "$FLAGS" | grep -oiP "\-l\s+\K\d+" | head -n 1 || echo "")
        CURRENT_MD=$(echo "$FLAGS" | grep -oiP "\-d\s+\K\d+" | head -n 1 || echo "")

        if [[ -n "$CURRENT_ML" ]] && [ "$CURRENT_ML" -gt "$CURRENT_CS" ]; then
            FLAGS=$(echo "$FLAGS" | sed -E "s/\-l\s+[0-9]+/-l $CURRENT_CS/")
        fi
        if [[ -n "$CURRENT_MD" ]] && [ "$CURRENT_MD" -gt "$CURRENT_CS" ]; then
            FLAGS=$(echo "$FLAGS" | sed -E "s/\-d\s+[0-9]+/-d $CURRENT_CS/")
        fi
    fi
    # Ensure we use -A
    echo "Verifying $asm against $red (flags: $FLAGS) ..."
    
    # Re-assemble
    # shellcheck disable=SC2086
    "$PMARS_EXEC" $FLAGS -A "$red" 2>pmars_err.tmp > assembled_tmp.asm
    PMARS_EXIT=$?
    
    if [ $PMARS_EXIT -ne 0 ]; then
        echo "::error file=$red::pmars failed to assemble with exit code $PMARS_EXIT"
        cat pmars_err.tmp
        EXIT_CODE=1
    else
        # Compare
        if ! diff -u "$asm" assembled_tmp.asm > diff.tmp; then
            echo "::error file=$asm::Assembly mismatch for $red"
            cat diff.tmp
            EXIT_CODE=1
        else
            echo "✅ Match: $red"
        fi
    fi
    rm -f assembled_tmp.asm pmars_err.tmp diff.tmp
done

exit $EXIT_CODE
