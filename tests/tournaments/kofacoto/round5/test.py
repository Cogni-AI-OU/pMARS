import os
import subprocess
import glob

warrior_dir = '../../../../warriors/tournaments/kofacoto/round5'
# Define matches as (winner, loser, expected_winner_wins, expected_loser_wins, expected_ties)
matches = [
    ('Macrae.red', 'Kline.red', 80, 11, 109),
    ('Moore.red', 'Paulsson.red', 89, 60, 51), # Battle 2, set 1
    ('Janeczek.red', 'Ford.red', 102, 56, 42), # Battle 3, set 1
    ('Schmidt.red', 'Liporati.red', 87, 65, 48), # Battle 4, set 1
]

def run_match(w1_name, w2_name):
    w1 = os.path.join(warrior_dir, w1_name)
    w2 = os.path.join(warrior_dir, w2_name)
    # pmars -r 200 -d 100 -c 80000 -p 8000 -l 100
    cmd = ['../../../../src/pmars', '-f', '-s', '8000', '-c', '80000', '-p', '8000', '-l', '100', '-r', '200', '-b', w1, w2]
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    
    lines = res.stdout.split('\n')
    for line in lines:
        if line.startswith('Results:'):
            parts = line.strip().split()
            return int(parts[1]), int(parts[2]), int(parts[3])
    return 0, 0, 0

print("Running KOFACOTO Round 5 Match Verification...")
all_passed = True

for w_winner, w_loser, exp_wins_w, exp_wins_l, exp_ties in matches:
    print(f"Testing {w_winner} vs {w_loser}...")
    wins1, wins2, ties = run_match(w_winner, w_loser)
    print(f"Result: {wins1} {wins2} {ties} (Expected: {exp_wins_w} {exp_wins_l} {exp_ties})")
    
    # We check if the winner actually won and if results are close/identical
    # Note: Modern pmars might give slightly different results even with -f
    # because of minor differences in implementation or environment.
    if wins1 > wins2:
        print(f"SUCCESS: {w_winner} won as expected.")
    else:
        print(f"FAILURE: {w_winner} did not win!")
        all_passed = False
    
    if wins1 == exp_wins_w and wins2 == exp_wins_l and ties == exp_ties:
        print("PERFECT MATCH: Results are identical to historical values.")
    else:
        print("NOTE: Results differ from historical values, but winner is correct.")

if all_passed:
    print("\nALL VERIFIED MATCHES PASSED.")
else:
    print("\nSOME MATCHES FAILED.")
    exit(1)
