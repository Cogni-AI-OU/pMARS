#!/bin/bash
# scripts/gen_red_asm.sh
# Automates .red.asm generation for .red files

# Get the directory from the first argument, default to 'warriors'
TARGET_DIR=${1:-warriors}
# Additional flags for pmars
PMARS_FLAGS=${2:-""}

# Find the pmars executable
PMARS_EXEC="src/pmars"

if [ ! -f "$PMARS_EXEC" ]; then
    echo "Error: $PMARS_EXEC not found. Please compile pMARS in the src directory first."
    exit 1
fi

# Find all .red files and generate .red.asm files
find "$TARGET_DIR" -type f -name "*.red" | while read -r red_file; do
    asm_file="${red_file}.asm"
    echo "Generating $asm_file with flags '$PMARS_FLAGS'..."
    # We use -A for assembly listing
    # shellcheck disable=SC2086
    "$PMARS_EXEC" $PMARS_FLAGS -A "$red_file" > "$asm_file"
    if [ $? -ne 0 ]; then
        echo "Warning: Failed to generate $asm_file"
        rm -f "$asm_file"
    fi
done

echo "Done."
