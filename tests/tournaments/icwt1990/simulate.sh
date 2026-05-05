#!/bin/bash
# ICWT 1990 Tournament Simulation
# Rules: 8192 core, 64 processes, 125000 cycles, 6 rounds per match, ICWS'88
# Format: Round-robin with 26 warriors.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PMARS="$ROOT_DIR/pmars"
WARRIORS_DIR="$ROOT_DIR/warriors/tournaments/icwt1990"

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

ALL_WARRIORS=(
    "paper.red" "doublestorm.red" "xtc.red" "scissors.red" "warrior42.red"
    "zd.red" "catcan.red" "dervish.red" "ze.red" "basilisk.red"
    "vlad.red" "mrbeef.red" "stone.red" "divers.red"
    "leaptoad.red" "dac.red" "lightning.red" "trout.red"
    "infester.red" "spook.red" "jujitsu.red" "beamer.red" "gato.red" "net.red"
)

echo "Simulating ICWT 1990 Tournament..."
echo "Settings: 8192 core, 64 processes, 125000 cycles, 6 rounds, ICWS'88"
echo "Format: Round-robin with 26 warriors"
echo ""

results_file=$(mktemp)

for ((i=0; i<${#ALL_WARRIORS[@]}; i++)); do
    for ((j=i+1; j<${#ALL_WARRIORS[@]}; j++)); do
        w1=${ALL_WARRIORS[$i]}
        w2=${ALL_WARRIORS[$j]}
        output=$($PMARS -8 -s 8192 -p 64 -l 64 -c 125000 -r 6 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>&1)
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
third_place=$(sed -n '3p' "${results_file}.sorted" | awk '{print $2}')

rm "$results_file" "${results_file}.sorted"

echo ""
echo "Official Results Check:"
if [[ "$winner" == "paper.red" && "$runner_up" == "doublestorm.red" && "$third_place" == "xtc.red" ]]; then
    echo "SUCCESS: Results match official tournament results!"
else
    echo "FAILURE: Results do not match official tournament results."
    echo "Expected: 1st: paper.red, 2nd: doublestorm.red, 3rd: xtc.red"
    echo "Got: 1st: $winner, 2nd: $runner_up, 3rd: $third_place"
    echo "Note: Historical scores might vary due to random start positions or minor pMARS differences."
fi