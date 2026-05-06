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
    CORESIZE=$(grep -i ";assert.*CORESIZE==" "$red" | sed -E 's/.*;[Aa][Ss][Ss][Ee][Rr][Tt].*CORESIZE==([0-9]+).*/\1/')
    if [[ "$CORESIZE" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -s $CORESIZE"
    fi

    # Check for ;assert MAXPROCESSES==...
    MAXPROCESSES=$(grep -i ";assert.*MAXPROCESSES==" "$red" | sed -E 's/.*;[Aa][Ss][Ss][Ee][Rr][Tt].*MAXPROCESSES==([0-9]+).*/\1/')
    if [[ "$MAXPROCESSES" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -p $MAXPROCESSES"
    fi

    # Check for ;assert MAXLENGTH==... or MAXINST==
    MAXLENGTH=$(grep -i ";assert.*MAXLENGTH==" "$red" | sed -E 's/.*;[Aa][Ss][Ss][Ee][Rr][Tt].*MAXLENGTH==([0-9]+).*/\1/')
    if [[ ! "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        MAXLENGTH=$(grep -i ";assert.*MAXINST==" "$red" | sed -E 's/.*;[Aa][Ss][Ss][Ee][Rr][Tt].*MAXINST==([0-9]+).*/\1/')
    fi
    if [[ "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -l $MAXLENGTH"
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
