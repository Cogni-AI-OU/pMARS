import os
import subprocess
import glob

warrior_dir = '../../../warriors/tournaments/acwt1997/round2'
target_warrior = 'electric.red'
warriors = [os.path.basename(f) for f in glob.glob(os.path.join(warrior_dir, '*.red'))]
if target_warrior in warriors:
    warriors.remove(target_warrior)

scores = {w: 0 for w in warriors}

print(f"Simulating ACWT 1997 Round 2: Beat Electric Head...")
print(f"Settings: 8000 core, 8000 processes, 80000 cycles, 1000 rounds, ICWS'94")
print(f"Testing {len(warriors)} warriors against {target_warrior}...")

target_path = os.path.join(warrior_dir, target_warrior)

for w_name in warriors:
    w_path = os.path.join(warrior_dir, w_name)
    # Run pmars with deterministic results (-f)
    # ICWS'94 rules: -s 8000 -p 8000 -c 80000
    cmd = ['../../../src/pmars', '-f', '-s', '8000', '-p', '8000', '-c', '80000', '-r', '1000', '-b', w_path, target_path]
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    
    lines = res.stdout.split('\n')
    for line in lines:
        if line.startswith('Results:'):
            parts = line.strip().split()
            w_wins = int(parts[1])
            target_wins = int(parts[2])
            ties = int(parts[3])
            # Score formula from website: wins*3 + ties
            scores[w_name] = w_wins * 3 + ties

print("\n--- Final Results ---")
sorted_scores = sorted(scores.items(), key=lambda x: x[1], reverse=True)
for i, (name, score) in enumerate(sorted_scores):
    print(f"{i+1}. {name}: {score} points")

winner = sorted_scores[0][0]
print("\nOfficial Results Check:")
if winner == "shelter.red":
    print("SUCCESS: Shelter is the winner, matching official tournament results!")
else:
    print(f"NOTE: Simulated winner is {winner}. Official winner was Shelter.")
