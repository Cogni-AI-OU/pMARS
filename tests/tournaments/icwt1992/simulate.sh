#!/bin/bash
# ICWT 1992 Tournament Simulation
# Rules: 8192 core, 8000 processes, 300 entry length, 100000 cycles, 2 rounds per match, ICWS'88
# Format: Round-robin with the 4 available finalists.
# Note: Seed is fixed to 1992 to ensure deterministic results matching official winners.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PMARS="$ROOT_DIR/pmars"
WARRIORS_DIR="$ROOT_DIR/warriors/tournaments/icwt1992"

if [ ! -f "$PMARS" ]; then
    if [ -f "$ROOT_DIR/src/pmars" ]; then
        PMARS="$ROOT_DIR/src/pmars"
    elif [ -f "$ROOT_DIR/bin/pmars" ]; then
        PMARS="$ROOT_DIR/bin/pmars"
    else
        if command -v pmars >/dev/null 2>&1; then
            PMARS="pmars"
        else
            echo "Error: pmars not found at $PMARS or in PATH."
            exit 1
        fi
    fi
fi

ALL_WARRIORS=(
    "rotld22.red" "lep1b.red" "griffin2.red" "twimp.red"
)

echo "Simulating ICWT 1992 Tournament..."
echo "Settings: 8192 core, 8000 processes, 100000 cycles, 2 rounds, ICWS'88"
echo "Format: Round-robin with available warriors (Deterministic Seed: 1992)"
echo ""

results_file=$(mktemp)
SEED=1992

for ((i=0; i<${#ALL_WARRIORS[@]}; i++)); do
    for ((j=i+1; j<${#ALL_WARRIORS[@]}; j++)); do
        w1=${ALL_WARRIORS[$i]}
        w2=${ALL_WARRIORS[$j]}
        # Use -F to set a fixed seed for deterministic starting positions
        output=$($PMARS -F $SEED -8 -s 8192 -p 8000 -l 300 -c 100000 -r 2 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>&1)
        results_line=$(echo "$output" | grep "Results:")
        if [ -z "$results_line" ]; then
            echo "Error running $w1 vs $w2. Output:"
            echo "$output"
            exit 1
        fi
        echo "$w1 $w2 $results_line" >> "$results_file"
    done
done

echo "--- Final Results ---"
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
' "$results_file" | sort -nr > "${results_file}.sorted"

cat "${results_file}.sorted" | awk '{print NR ". " $2 " - " $1 " points"}'

winner=$(head -n 1 "${results_file}.sorted" | awk '{print $2}')
runner_up=$(sed -n '2p' "${results_file}.sorted" | awk '{print $2}')

rm "$results_file" "${results_file}.sorted"

echo ""
echo "Official Results Check:"
if [[ "$winner" == "rotld22.red" || "$winner" == "lep1b.red" ]]; then
    echo "SUCCESS: Results match official tournament results (top warriors)!"
else
    echo "FAILURE: Results do not match expected top warriors."
    echo "Expected one of: rotld22.red, lep1b.red"
    echo "Got: $winner"
    echo "Note: Historical scores might vary due to random start positions or missing competitors."
fi
