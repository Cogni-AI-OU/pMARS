import os
import subprocess
import glob

warrior_dir = '../../../warriors/tournaments/battleroyal1996'
warriors = [os.path.basename(f) for f in glob.glob(os.path.join(warrior_dir, '*.red'))]

scores = {w: 0 for w in warriors}

print(f"Running round-robin with {len(warriors)} warriors (200 rounds)...")

for i in range(len(warriors)):
    for j in range(i + 1, len(warriors)):
        w1_name = warriors[i]
        w2_name = warriors[j]
        w1 = os.path.join(warrior_dir, w1_name)
        w2 = os.path.join(warrior_dir, w2_name)
        
        # Run pmars with deterministic results (-f), 8 processes (-p 8), and 200 rounds (-r 200)
        cmd = ['../../../src/pmars', '-f', '-s', '8000', '-p', '8', '-c', '80000', '-r', '200', '-b', w1, w2]
        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        
        lines = res.stdout.split('\n')
        for line in lines:
            if line.startswith('Results:'):
                parts = line.strip().split()
                # parts[1] is w1 wins, parts[2] is w2 wins, parts[3] is ties
                w1_wins = int(parts[1])
                w2_wins = int(parts[2])
                ties = int(parts[3])
                scores[w1_name] += w1_wins * 3 + ties
                scores[w2_name] += w2_wins * 3 + ties

print("\nFinal Scores:")
sorted_scores = sorted(scores.items(), key=lambda x: x[1], reverse=True)
for i, (name, score) in enumerate(sorted_scores, 1):
    print(f"{i}. {name}: {score} points")

winner = sorted_scores[0][0]
print("\nOfficial Results Check:")
if "iocane" in winner.lower():
    print("SUCCESS: Results match historical winner (Iocane)!")
else:
    print(f"NOTE: Simulated winner is {winner}. Historical winner was Iocane.")
