#!/bin/bash
# ICWT 1987 Tournament Simulation
# Rules: 8192 core, 64 processes, 50000 cycles, 3 rounds per match, ICWS'86
# Elimination format:
# 1. Round-robin with 8 warriors, top 4 advance.
# 2. Round-robin with 4 warriors, top 2 advance.
# 3. Final match between top 2.

PMARS="/home/runner/work/pMARS/pMARS/pmars"
WARRIORS_DIR="/home/runner/work/pMARS/pMARS/warriors/tournaments/icwt1987"
ALL_WARRIORS=("dracula.red" "ferret.red" "jr-26.red" "kiss.red" "parasite-6.red" "piper.red" "plague.red" "w2.red")

echo "Simulating ICWT 1987 Tournament..."
echo "Settings: 8192 core, 64 processes, 50000 cycles, 3 rounds"
echo ""

run_round_robin() {
    local warriors=("$@")
    local results_file=$(mktemp)
    
    for ((i=0; i<${#warriors[@]}; i++)); do
        for ((j=i+1; j<${#warriors[@]}; j++)); do
            w1=${warriors[$i]}
            w2=${warriors[$j]}
        # Run pmars with specified rules (3 rounds)
        output=$($PMARS -s 8192 -p 64 -c 50000 -r 3 -b "$WARRIORS_DIR/$w1" "$WARRIORS_DIR/$w2" 2>/dev/null)

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

echo "--- Stage 1: 8 Warriors ---"
stage1_results=$(run_round_robin "${ALL_WARRIORS[@]}")
echo "$stage1_results" | awk '{print NR ". " $2 " - " $1 " points"}'
top4=($(echo "$stage1_results" | head -n 4 | awk '{print $2}'))

echo ""
echo "--- Stage 2: Top 4 Advance ---"
echo "Advancing: ${top4[*]}"
stage2_results=$(run_round_robin "${top4[@]}")
echo "$stage2_results" | awk '{print NR ". " $2 " - " $1 " points"}'
top2=($(echo "$stage2_results" | head -n 2 | awk '{print $2}'))
third_place=$(echo "$stage2_results" | sed -n '3p' | awk '{print $2}')

echo ""
echo "--- Stage 3: Final Match ---"
echo "Finalists: ${top2[*]}"
final_output=$($PMARS -8 -s 8192 -p 64 -c 50000 -r 3 -b "$WARRIORS_DIR/${top2[0]}" "$WARRIORS_DIR/${top2[1]}" 2>/dev/null)
final_results_line=$(echo "$final_output" | grep "Results:")
echo "Results: $final_results_line"

win1=$(echo "$final_results_line" | awk '{print $2}')
win2=$(echo "$final_results_line" | awk '{print $3}')

if [ "$win1" -ge "$win2" ]; then
    winner=${top2[0]}
    runner_up=${top2[1]}
else
    winner=${top2[1]}
    runner_up=${top2[0]}
fi

echo ""
echo "Final Results:"
echo "1st: $winner"
echo "2nd: $runner_up"
echo "3rd: $third_place"

# Final check
echo ""
echo "Official Results Check:"
if [[ "$winner" == "ferret.red" && "$runner_up" == "plague.red" && "$third_place" == "piper.red" ]]; then
    echo "SUCCESS: Results match official tournament results!"
else
    echo "FAILURE: Results do not match official tournament results."
fi
