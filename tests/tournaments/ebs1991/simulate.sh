#!/bin/bash
# EBS ICWS Qualification Tournament (Nov 1991) Simulation
# Rules: 8192 core, 64 processes, 100000 cycles, 6 rounds per match, ICWS'88
# Format: One-on-one round robin with self-fights.
# Note: Not all warriors are available.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../" && pwd)"
PMARS="$ROOT_DIR/pmars"
WARRIORS_DIR="$ROOT_DIR/warriors/tournaments/ebs1991"

if [ ! -f "$PMARS" ]; then
    if [ -f "$ROOT_DIR/src/pmars" ]; then
        PMARS="$ROOT_DIR/src/pmars"
    elif [ -f "$ROOT_DIR/bin/pmars" ]; then
        PMARS="$ROOT_DIR/bin/pmars"
    else
        if command -v pmars >/dev/null 2>&1; then
            PMARS="pmars"
        else
            echo "Error: pmars not found. Please compile it first."
            exit 1
        fi
    fi
fi

# Warriors in the tournament (as per official results)
# Available ones in this repo:
ALL_WARRIORS=(
    "xtc.red"
    "quarter.red"
    "vlad.red"
    "dac.red"
    "mrnasty.red"
    "dervish.red"
)

# Missing ones:
# "sonic.red"
# "influenza.red"
# "spider.red"

echo "Simulating EBS ICWS Qualification Tournament (Nov 1991)..."
echo "Settings: 8192 core, 64 processes, 100000 cycles, 6 rounds, ICWS'88"
echo "Format: One-on-one round robin with self-fights"
echo ""

results_file=$(mktemp)

for ((i=0; i<${#ALL_WARRIORS[@]}; i++)); do
    for ((j=i; j<${#ALL_WARRIORS[@]}; j++)); do
        w1=${ALL_WARRIORS[$i]}
        w2=${ALL_WARRIORS[$j]}
        
        # Historical parameters:
        # Rounds: 6
        # Cycles: 100000
        # Processes: 64
        # Core: 8192
        # Fixed seed: -f
        output=$($PMARS -8 -f -s 8192 -p 64 -l 64 -c 100000 -r 6 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>&1)
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
fi
