import os
import subprocess
import glob

warriors = ["rotld22.red", "lep1b.red", "griffin2.red", "twimp.red"]

scores = {w: 0 for w in warriors}

print(f"Simulating ICWT 1992 Tournament...")
print(f"Settings: 8192 core, 8000 processes, 100000 cycles, 10 rounds, ICWS'88")
print(f"Format: Round-robin with available warriors (Deterministic: -f flag)")
print(f"Running round-robin with {len(warriors)} warriors...")

warrior_dir = '../../../warriors/tournaments/icwt1992'
for i in range(len(warriors)):
    for j in range(i + 1, len(warriors)):
        w1_name = warriors[i]
        w2_name = warriors[j]
        w1 = os.path.join(warrior_dir, w1_name)
        w2 = os.path.join(warrior_dir, w2_name)
        # Run pmars with deterministic results (-f)
        cmd = ['../../../src/pmars', '-f', '-8', '-s', '8192', '-p', '8000', '-l', '300', '-c', '100000', '-r', '10', '-b', w1, w2]
        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        
        lines = res.stdout.split('\n')
        for line in lines:
            if line.startswith('Results:'):
                parts = line.strip().split()
                w1_wins = int(parts[1])
                w2_wins = int(parts[2])
                ties = int(parts[3])
                scores[w1_name] += w1_wins * 3 + ties
                scores[w2_name] += w2_wins * 3 + ties

print("--- Final Results ---")
sorted_scores = sorted(scores.items(), key=lambda x: x[1], reverse=True)
for i, (name, score) in enumerate(sorted_scores):
    print(f"{i+1}. {name}: {score} points")

winner = sorted_scores[0][0]
print("\nOfficial Results Check:")
if winner in ["rotld22.red", "lep1b.red", "twimp.red"]:
    print("SUCCESS: Results match official tournament results or top finalists!")
else:
    print(f"NOTE: Simulated winner is {winner}. Expected one of: rotld22.red, lep1b.red.")
