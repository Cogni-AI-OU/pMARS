#!/bin/bash
# scripts/gen_red_asm.sh
# Automates .red.asm generation for .red files with auto-detection of flags

# Get the directory from the first argument, default to 'warriors'
TARGET_DIR=${1:-warriors}
# Additional manual flags for pmars
MANUAL_FLAGS=${2:-""}

# Find the pmars executable
PMARS_EXEC="src/pmars"

if [ ! -f "$PMARS_EXEC" ]; then
    echo "Error: $PMARS_EXEC not found. Please compile pMARS in the src directory first."
    exit 1
fi

# Find all .red files and generate .red.asm files
find "$TARGET_DIR" -type f -name "*.red" | while read -r red_file; do
    asm_file="${red_file}.asm"
    
    # Auto-detect flags from .red file
    FLAGS=""
    
    # Check for ;assert CORESIZE==...
    CORESIZE=$(grep -i ";assert.*CORESIZE==" "$red_file" | sed -E 's/.*;[Aa][Ss][Ss][Ee][Rr][Tt].*CORESIZE==([0-9]+).*/\1/')
    if [[ "$CORESIZE" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -s $CORESIZE"
    fi

    # Check for ;assert MAXPROCESSES==...
    MAXPROCESSES=$(grep -i ";assert.*MAXPROCESSES==" "$red_file" | sed -E 's/.*;[Aa][Ss][Ss][Ee][Rr][Tt].*MAXPROCESSES==([0-9]+).*/\1/')
    if [[ "$MAXPROCESSES" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -p $MAXPROCESSES"
    fi

    # Check for ;assert MAXLENGTH==... or MAXINST==
    MAXLENGTH=$(grep -i ";assert.*MAXLENGTH==" "$red_file" | sed -E 's/.*;[Aa][Ss][Ss][Ee][Rr][Tt].*MAXLENGTH==([0-9]+).*/\1/')
    if [[ ! "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        MAXLENGTH=$(grep -i ";assert.*MAXINST==" "$red_file" | sed -E 's/.*;[Aa][Ss][Ss][Ee][Rr][Tt].*MAXINST==([0-9]+).*/\1/')
    fi
    if [[ "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -l $MAXLENGTH"
    fi
    
    # Check for ;pmars-flags:
    FILE_FLAGS=$(grep -i ";pmars-flags:" "$red_file" | sed 's/.*;pmars-flags://I')
    if [ -n "$FILE_FLAGS" ]; then
        FLAGS="$FLAGS $FILE_FLAGS"
    fi
    
    # Directory based defaults if not already set
    if [[ "$red_file" == *"warriors/94Nano"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 80"
        [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 80"
    elif [[ "$red_file" == *"warriors/94tiny"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 800"
        [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 800"
    elif [[ "$red_file" == *"warriors/94LP"* ]]; then
        [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 500"
    elif [[ "$red_file" == *"warriors/88Tourney"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 8192"
        if [[ "$red_file" == *"fingerprint.red" ]]; then
             [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 300"
        fi
    fi

    # Append manual flags
    ALL_FLAGS="$FLAGS $MANUAL_FLAGS"

    echo "Generating $asm_file with flags '$ALL_FLAGS'..."
    # We use -A for assembly listing
    # shellcheck disable=SC2086
    "$PMARS_EXEC" $ALL_FLAGS -A "$red_file" > "$asm_file"
    if [ $? -ne 0 ]; then
        echo "Warning: Failed to generate $asm_file"
        rm -f "$asm_file"
    fi
done

echo "Done."
