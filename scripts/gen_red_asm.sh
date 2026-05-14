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
    CORESIZE=$(grep -i ";assert" "$red_file" | grep -oiP "CORESIZE\D+\K\d+" | head -n 1 || echo "")
    if [[ "$CORESIZE" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -s $CORESIZE"
    fi

    # Check for ;assert MAXPROCESSES==...
    MAXPROCESSES=$(grep -i ";assert" "$red_file" | grep -oiP "MAXPROCESSES\D+\K\d+" | head -n 1 || echo "")
    if [[ "$MAXPROCESSES" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -p $MAXPROCESSES"
    fi

    # Check for ;assert MAXLENGTH==... or MAXINST==
    MAXLENGTH=$(grep -i ";assert" "$red_file" | grep -oiP "MAXLENGTH\D+\K\d+" | head -n 1 || echo "")
    if [[ ! "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        MAXLENGTH=$(grep -i ";assert" "$red_file" | grep -oiP "MAXINST\D+\K\d+" | head -n 1 || echo "")
    fi
    if [[ "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -l $MAXLENGTH"
    fi

    # Check for ;assert MAXCYCLES==...
    MAXCYCLES=$(grep -i ";assert" "$red_file" | grep -oiP "MAXCYCLES\D+\K\d+" | head -n 1 || echo "")
    if [[ "$MAXCYCLES" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -c $MAXCYCLES"
    fi

    # Check for ;assert MINDISTANCE==...
    MINDISTANCE=$(grep -i ";assert" "$red_file" | grep -oiP "MINDISTANCE\D+\K\d+" | head -n 1 || echo "")
    if [[ "$MINDISTANCE" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -d $MINDISTANCE"
    fi
    if [[ "$MAXLENGTH" =~ ^[0-9]+$ ]]; then
        FLAGS="$FLAGS -l $MAXLENGTH"
    fi
    
    # Check for ;pmars-flags:
    FILE_FLAGS=$(grep -i ";pmars-flags:" "$red_file" | sed 's/.*;pmars-flags://I')
    if [ -n "$FILE_FLAGS" ]; then
        FLAGS="$FLAGS $FILE_FLAGS"
    fi

    # Set some safe defaults if not already set by assertions
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
    elif [[ "$red_file" == *"warriors/tournaments/ebs1991"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 8192"
        [[ "$FLAGS" == *"-8"* ]] || FLAGS="$FLAGS -8"
    fi

    # Ensure MAXLENGTH and MINDISTANCE don't exceed CORESIZE if set
    CURRENT_CS=$(echo "$FLAGS" | grep -oiP "\-s\s+\K\d+" | head -n 1 || echo "")
    if [[ -n "$CURRENT_CS" ]]; then
        CURRENT_ML=$(echo "$FLAGS" | grep -oiP "\-l\s+\K\d+" | head -n 1 || echo "")
        CURRENT_MD=$(echo "$FLAGS" | grep -oiP "\-d\s+\K\d+" | head -n 1 || echo "")

        if [[ -n "$CURRENT_ML" ]] && [ "$CURRENT_ML" -gt "$CURRENT_CS" ]; then
            FLAGS=$(echo "$FLAGS" | sed "s/-l $CURRENT_ML/-l $CURRENT_CS/")
            CURRENT_ML=$CURRENT_CS
        fi
        if [[ -n "$CURRENT_ML" ]] && [ "$CURRENT_ML" -gt 10000 ]; then
            FLAGS=$(echo "$FLAGS" | sed "s/-l $CURRENT_ML/-l 10000/")
        fi
        if [[ -n "$CURRENT_MD" ]] && [ "$CURRENT_MD" -gt "$CURRENT_CS" ]; then
            FLAGS=$(echo "$FLAGS" | sed "s/-d $CURRENT_MD/-d $CURRENT_CS/")
        fi
    fi
    
    # Set some safe defaults if not already set by assertions
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
    elif [[ "$red_file" == *"warriors/tournaments/ebs1991"* ]]; then
        [[ "$FLAGS" == *"-s "* ]] || FLAGS="$FLAGS -s 8192"
        [[ "$FLAGS" == *"-8"* ]] || FLAGS="$FLAGS -8"
    elif [[ "$red_file" == *"warriors/tournaments/"* ]]; then
        # For tournament warriors, use CORESIZE as default length if specified
        TEMP_CS=$(echo "$FLAGS" | grep -oiP "\-s\s+\K\d+" | head -n 1 || echo "")
        if [[ -n "$TEMP_CS" ]]; then
            [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l $TEMP_CS"
        else
            [[ "$FLAGS" == *"-l "* ]] || FLAGS="$FLAGS -l 8000"
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
