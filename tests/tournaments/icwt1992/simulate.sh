#!/bin/bash
# ICWT 1992 Tournament Simulation
# Rules: ICWS'94 draft standard, 8000 core, 80000 cycles
# 10 rounds per match

# Determine paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PMARS="$ROOT_DIR/pmars"
WARRIORS_DIR="$ROOT_DIR/warriors/tournaments/icwt1992"

# Check if pmars exists, try src/pmars or bin/pmars as fallback
if [ ! -f "$PMARS" ]; then
    if [ -f "$ROOT_DIR/src/pmars" ]; then
        PMARS="$ROOT_DIR/src/pmars"
    elif [ -f "$ROOT_DIR/bin/pmars" ]; then
        PMARS="$ROOT_DIR/bin/pmars"
    else
        # Try finding it in PATH
        if command -v pmars >/dev/null 2>&1; then
            PMARS="pmars"
        else
            echo "Error: pmars not found at $PMARS or in PATH."
            exit 1
        fi
    fi
fi

# List of available warriors for 1992
ALL_WARRIORS=($(ls "$WARRIORS_DIR"/*.red | xargs -n1 basename))

echo "Simulating ICWT 1992 Tournament..."
echo "Settings: 8000 core, 80000 cycles, 8000 max processes, 10 rounds"
echo ""

results_file=$(mktemp)

for ((i=0; i<${#ALL_WARRIORS[@]}; i++)); do
    for ((j=i+1; j<${#ALL_WARRIORS[@]}; j++)); do
        w1=${ALL_WARRIORS[$i]}
        w2=${ALL_WARRIORS[$j]}
        # Run pmars with deterministic results (-f)
        output=$($PMARS -f -s 8000 -c 80000 -p 8000 -r 10 -l 100 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>/dev/null)
        
        results_line=$(echo "$output" | grep "Results:")
        echo "$w1 $w2 $results_line" >> "$results_file"
    done
done

# Calculate scores and sort
echo "--- Final Standings ---"
awk '
{
    w1=$1; w2=$2; win1=$4; win2=$5; ties=$6;
    score1 = win1 * 3 + ties * 1;
    score2 = win2 * 3 + ties * 1;
    total_score[w1] += score1;
    total_score[w2] += score2;
}
END {
    for (w in total_score) {
        print total_score[w], w;
    }
}
' "$results_file" | sort -nr > "${results_file}_sorted"

cat "${results_file}_sorted" | awk '{print NR ". " $2 " - " $1 " points"}'

rm "$results_file" "${results_file}_sorted"
