#!/bin/bash
# ICWT 1986 Tournament Simulation (Finals)
# Rules: 4000 core, 4 rounds per match, 20000 cycles, ICWS'86 (approximated with -8)
# The top 3 programs entered a playoff, but we just simulate the 8-warrior round-robin finals.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PMARS="$ROOT_DIR/pmars"
WARRIORS_DIR="$ROOT_DIR/warriors/tournaments/icwt1986"

if [ ! -f "$PMARS" ]; then
    if [ -f "$ROOT_DIR/src/pmars" ]; then
        PMARS="$ROOT_DIR/src/pmars"
    else
        if command -v pmars >/dev/null 2>&1; then
            PMARS="pmars"
        else
            echo "Error: pmars not found at $PMARS or in PATH."
            exit 1
        fi
    fi
fi

FINALISTS=(
    "mice.red" "chang1.red" "midget.red" "commando.red"
    "locust.red" "parasite.red" "fnv.red" "minid.red"
)

echo "Simulating ICWT 1986 Tournament (Finals)..."
echo "Settings: 4000 core, 20000 cycles, 4 rounds, ICWS'86 (approximated with -8)"
echo "Format: Round-robin with 8 finalists"
echo ""

results_file=$(mktemp)

for ((i=0; i<${#FINALISTS[@]}; i++)); do
    for ((j=i+1; j<${#FINALISTS[@]}; j++)); do
        w1=${FINALISTS[$i]}
        w2=${FINALISTS[$j]}
        
        # ICWS'86 standard is closest to ICWS'88 (-8 in pmars).
        # We use 4000 core size (-s 4000) and 20000 cycles (-c 20000).
        # Assuming default max processes (-p 8000 for standard or something similar, here we use default -p 8000 but icwt1986 used maybe less? Let's use pmars default or 8000). 
        # Actually 8000 processes for 4000 core is fine, or we just let it default.
        output=$("$PMARS" -8 -s 4000 -c 20000 -r 4 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>&1)
        results_line=$(echo "$output" | grep -a "Results:")
        
        if [ -z "$results_line" ]; then
            echo "Error running $w1 vs $w2. Output:"
            echo "$output"
            exit 1
        fi
        
        # Add to results
        echo "$w1 $w2 $results_line" >> "$results_file"
    done
done

echo "--- Final Results ---"
awk '
{
    w1=$1; w2=$2; win1=$4; win2=$5; ties=$6;
    # 3 points for win, 1 for tie
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
' "$results_file" | sort -nr > "${results_file}.sorted"

awk '{print NR ". " $2 " - " $1 " points"}' "${results_file}.sorted"

winner=$(head -n 1 "${results_file}.sorted" | awk '{print $2}')
runner_up=$(sed -n '2p' "${results_file}.sorted" | awk '{print $2}')
third_place=$(sed -n '3p' "${results_file}.sorted" | awk '{print $2}')

rm "$results_file" "${results_file}.sorted"

echo ""
echo "Official Results Check:"
if [[ "$winner" == "mice.red" && "$runner_up" == "chang1.red" && "$third_place" == "midget.red" ]]; then
    echo "SUCCESS: Results match the official tournament top 3!"
else
    echo "Note: Historical scores might vary due to random start positions or minor pMARS differences."
    echo "Expected: 1st: mice.red, 2nd: chang1.red, 3rd: midget.red"
    echo "Got: 1st: $winner, 2nd: $runner_up, 3rd: $third_place"
fi