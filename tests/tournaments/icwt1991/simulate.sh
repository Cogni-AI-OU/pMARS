#!/bin/bash
# ICWT 1991 Tournament Simulation
# Rules: 8192 core, 64 processes, 100000 cycles, 2 rounds per match, ICWS'88
# Format: Round-robin with 16 warriors (Note: Only 4 available in this repo).
# Includes self-fights.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PMARS="$ROOT_DIR/pmars"
WARRIORS_DIR="$ROOT_DIR/warriors/tournaments/icwt1991"

if [ ! -f "$PMARS" ]; then
    if [ -f "$ROOT_DIR/src/pmars" ]; then
        PMARS="$ROOT_DIR/src/pmars"
    elif [ -f "$ROOT_DIR/bin/pmars" ]; then
        PMARS="$ROOT_DIR/bin/pmars"
    else
        if command -v pmars >/dev/null 2>&1; then
            PMARS="pmars"
        else
            echo "Error: pmars not found at $PMARS or in PATH. Please compile it first."
            exit 1
        fi
    fi
fi

# List of warriors available in the repository
ALL_WARRIORS=(
    "xtc.red"
    "vlad.red"
    "quarter.red"
    "dac.red"
)

echo "Simulating ICWT 1991 Tournament..."
echo "Settings: 8192 core, 64 processes, 100000 cycles, 2 rounds, ICWS'88"
echo "Format: Round-robin with self-fights"
echo ""

results_file=$(mktemp)

for ((i=0; i<${#ALL_WARRIORS[@]}; i++)); do
    for ((j=i; j<${#ALL_WARRIORS[@]}; j++)); do
        w1=${ALL_WARRIORS[$i]}
        w2=${ALL_WARRIORS[$j]}
        # Run pmars with the specified rules
        # -8: strict ICWS'88
        # -s 8192: coresize
        # -p 64: max processes
        # -c 100000: cycles
        # -r 2: rounds
        # -b: brief output
        # -f: fixed (deterministic) seed
        output=$($PMARS -8 -f -s 8192 -p 64 -l 64 -c 100000 -r 2 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>&1)
        results_line=$(echo "$output" | grep "Results:")
        if [ -z "$results_line" ]; then
            echo "Error running $w1 vs $w2. Output:"
            echo "$output"
            exit 1
        fi
        echo "$w1 $w2 $results_line" >> "$results_file"
    done
done

echo "--- Final Standings (Simulated) ---"
awk '
{
    w1=$1; w2=$2; win1=$4; win2=$5; ties=$6;
    score1 = win1 * 3 + ties * 1;
    score2 = win2 * 3 + ties * 1;
    total_score[w1] += score1;
    if (w1 != w2) {
        total_score[w2] += score2;
    }
}
END {
    for (w in total_score) {
        print total_score[w], w;
    }
}
' "$results_file" | sort -nr > "${results_file}.sorted"

cat "${results_file}.sorted" | awk '{print NR ". " $2 " - " $1 " points"}'

winner=$(head -n 1 "${results_file}.sorted" | awk '{print $2}')

rm "$results_file" "${results_file}.sorted"

echo ""
echo "Official Results Check:"
if [[ "$winner" == "xtc.red" ]]; then
    echo "SUCCESS: XTC is the winner, matching official tournament results!"
else
    echo "NOTE: Simulated winner is $winner. Official winner was XTC."
    echo "Historical scores might vary due to different initial positions or minor pMARS versions."
fi
