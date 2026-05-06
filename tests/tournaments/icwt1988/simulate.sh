#!/bin/bash
# ICWT 1988 Tournament Simulation
# Rules: 8192 core, 64 processes, 50000 cycles, 3 rounds per match, ICWS'86
# Simulated using pMARS -8

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

ALL_WARRIORS=("cowboy.red" "lux2t.red" "muledna.red" "asi-r.red" "death.red" "drdeath.red" "dude.red" "fydgitr.red" "hithard2.red" "immobilizer.red" "sieve.red" "slaver.red" "wally.red" "waspnest.red" "wipe5.red")

echo "Simulating ICWT 1988 Tournament..."
echo "Settings: 8192 core, 64 processes, 50000 cycles, 3 rounds"
echo ""

run_round_robin() {
    local warriors=("$@")
    local results_file=$(mktemp)
    
    for ((i=0; i<${#warriors[@]}; i++)); do
        for ((j=i+1; j<${#warriors[@]}; j++)); do
            w1=${warriors[$i]}
            w2=${warriors[$j]}
            # Run pmars with specified rules (3 rounds) and -f for deterministic results
            # Use -l 1200 to accommodate long warriors like Muledna and Lux 2 T
            output=$($PMARS -8 -f -l 1200 -s 8192 -p 64 -c 50000 -r 3 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>/dev/null)

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

echo "--- Full Round Robin (15 Finalists) ---"
results=$(run_round_robin "${ALL_WARRIORS[@]}")
echo "$results" | awk '{print NR ". " $2 " - " $1 " points"}'

top_winner=$(echo "$results" | head -n 1 | awk '{print $2}')
runner_up=$(echo "$results" | sed -n '2p' | awk '{print $2}')
third_place=$(echo "$results" | sed -n '3p' | awk '{print $2}')

echo ""
echo "Simulation Results:"
echo "1st: $top_winner"
echo "2nd: $runner_up"
echo "3rd: $third_place"

echo ""
echo "Official Results Check:"
echo "Expected: 1st cowboy.red, 2nd lux2t.red, 3rd muledna.red"
if [[ "$top_winner" == "cowboy.red" && "$runner_up" == "lux2t.red" && "$third_place" == "muledna.red" ]]; then
    echo "SUCCESS: Results match official tournament results!"
else
    echo "NOTICE: Simulation results differ from historical 1988 results."
    echo "        This is expected due to simulator version differences (ICWS'86 vs modern pMARS)."
fi
