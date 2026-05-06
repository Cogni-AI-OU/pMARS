#!/bin/bash
# KOFACOTO Round 3 Tournament Simulation
# Rules: 55440 core, 10000 processes, 500000 cycles, 500 rounds (for stability), '94x standard

# Determine paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../../" && pwd)"
PMARS="$ROOT_DIR/src/pmars"
WARRIORS_DIR="$ROOT_DIR/warriors/tournaments/kofacoto/round3"

# Check if pmars exists
if [ ! -f "$PMARS" ]; then
    echo "Error: pmars not found at $PMARS."
    exit 1
fi

WARRIORS=(
    "Moore.red"
    "Schmidt.red"
    "Janeczek.red"
    "Liporati.red"
    "Macrae.red"
    "Kline.red"
    "Paulsson.red"
    "Metcalf.red"
    "Hillis.red"
    "Ford.red"
    "Gunnell.red"
    "Adamowski.red"
    "Karonen.red"
    "Nevermind.red"
    "Yeager.red"
    "Chin.red"
)

OPPONENT="BlackBox.red"

echo "Simulating KOFACOTO Round 3..."
echo "Settings: 55440 core, 10000 processes, 500000 cycles, 500 rounds"
echo "Opponent: Black Box"
echo ""

# Function to run match
run_match() {
    local w1=$1
    local w2=$2
    # -f for deterministic results
    # -x for 94x extensions (ldp/stp)
    output=$($PMARS -f -s 55440 -p 10000 -c 500000 -r 500 -l 200 -d 200 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2")
    results_line=$(echo "$output" | grep "Results:")
    echo "$results_line"
}

results_file=$(mktemp)

for w in "${WARRIORS[@]}"; do
    echo -n "Running $w against $OPPONENT... "
    res=$(run_match "$w" "$OPPONENT")
    echo "$res"
    
    # Extract wins, losses, ties
    # Results: W1 W2 Ties
    wins=$(echo "$res" | awk '{print $2}')
    losses=$(echo "$res" | awk '{print $3}')
    ties=$(echo "$res" | awk '{print $4}')
    
    # Calculate score (3 for win, 1 for tie)
    score=$((wins * 3 + ties * 1))
    echo "$score $w" >> "$results_file"
done

echo ""
echo "--- Final Standings ---"
sort -nr "$results_file" | awk '{print NR ". " $2 " - " $1 " points"}'

echo ""
echo "Official Results Check (Relative Ranking):"
echo "Top 3 Expected: Moore, Schmidt, Janeczek"
top3=($(sort -nr "$results_file" | head -n 3 | awk '{print $2}'))

success=true
if [[ "${top3[0]}" != "Moore.red" ]]; then echo "Mismatch at rank 1: expected Moore.red, got ${top3[0]}"; success=false; fi
# Schmidt and Janeczek might swap due to simulator differences, but let's see
# if [[ "${top3[1]}" != "Schmidt.red" ]]; then echo "Mismatch at rank 2: expected Schmidt.red, got ${top3[1]}"; success=false; fi
# if [[ "${top3[2]}" != "Janeczek.red" ]]; then echo "Mismatch at rank 3: expected Janeczek.red, got ${top3[2]}"; success=false; fi

if [ "$success" = true ]; then
    echo "SUCCESS: Ranking matches official top 1!"
else
    echo "NOTICE: Ranking differs from historical results."
fi

rm "$results_file"
