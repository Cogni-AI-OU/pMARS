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
    CORESIZE=$(grep -i ";assert.*CORESIZE==" "$red" | sed 's/.*;assert.*CORESIZE==\([0-9]*\).*/\1/')
    if [ -n "$CORESIZE" ]; then
        FLAGS="$FLAGS -s $CORESIZE"
    fi
    
    # Check for ;pmars-flags:
    FILE_FLAGS=$(grep -i ";pmars-flags:" "$red" | sed 's/.*;pmars-flags://I')
    if [ -n "$FILE_FLAGS" ]; then
        FLAGS="$FLAGS $FILE_FLAGS"
    fi
    
    # Directory based defaults if not already set
    if [[ "$red" == *"warriors/88Standard"* && ! "$FLAGS" == *"-s "* ]]; then
        # Actually many 88Standard assert 8000, which is default.
        # But some might need 8192. We'll stick to what's in the file or default.
        : 
    elif [[ "$red" == *"warriors/88Tourney"* && ! "$FLAGS" == *"-s "* ]]; then
        FLAGS="$FLAGS -s 8192"
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
