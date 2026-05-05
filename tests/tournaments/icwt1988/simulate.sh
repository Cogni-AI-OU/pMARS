#!/bin/bash
# ICWT 1988 Tournament Simulation
# Rules: 8192 core, 64 processes, 50000 cycles, 10 rounds per match, ICWS'86
# Elimination format:
# Round-robin with 15 warriors.

# Determine paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PMARS="$ROOT_DIR/pmars"
WARRIORS_DIR="$ROOT_DIR/warriors/tournaments/icwt1988"

# Check if pmars exists, try src/pmars as fallback
if [ ! -f "$PMARS" ]; then
    if [ -f "$ROOT_DIR/src/pmars" ]; then
        PMARS="$ROOT_DIR/src/pmars"
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

ALL_WARRIORS=("asi-r.red" "cowboy.red" "death.red" "drdeath.red" "dude.red" "fydgitr.red" "hithard2.red" "immobilizer.red" "lux2t.red" "muledna.red" "sieve.red" "slaver.red" "wally.red" "waspnest.red" "wipe5.red")

echo "Simulating ICWT 1988 Tournament..."
echo "Settings: 8192 core, 64 processes, 50000 cycles, 10 rounds"
echo ""

run_round_robin() {
    local warriors=("$@")
    local results_file=$(mktemp)
    
    for ((i=0; i<${#warriors[@]}; i++)); do
        for ((j=i+1; j<${#warriors[@]}; j++)); do
            w1=${warriors[$i]}
            w2=${warriors[$j]}
        # Run pmars with specified rules
        output=$($PMARS -8 -s 8192 -p 64 -c 50000 -r 10 -l 1000 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>/dev/null)

            results_line=$(echo "$output" | grep "Results:")
            echo "$w1 $w2 $results_line" >> "$results_file"
        done
    done

    # Calculate scores and sort
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
    ' "$results_file" | sort -nr
    rm "$results_file"
}

echo "--- Round Robin: 15 Warriors ---"
stage1_results=$(run_round_robin "${ALL_WARRIORS[@]}")
echo "$stage1_results" | awk '{print NR ". " $2 " - " $1 " points"}'
top3=($(echo "$stage1_results" | head -n 3 | awk '{print $2}'))

echo ""
echo "Final Results (Top 3):"
echo "1st: ${top3[0]}"
echo "2nd: ${top3[1]}"
echo "3rd: ${top3[2]}"

# Final check
echo ""
echo "Official Results Check:"
echo "1st: cowboy.red"
echo "2nd: lux2t.red"
echo "3rd: muledna.red"
echo "Simulation results may vary due to differences in pmars implementation of older standards and RNG."
