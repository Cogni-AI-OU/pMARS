import os
import subprocess
import glob

warriors = glob.glob('*.red')
if 'test1.red' in warriors:
    warriors.remove('test1.red')

scores = {w: 0 for w in warriors}

print("Running round-robin...")

for i in range(len(warriors)):
    for j in range(i + 1, len(warriors)):
        w1 = warriors[i]
        w2 = warriors[j]
        # Run pmars
        cmd = ['../../../src/pmars', '-8', '-s', '8192', '-c', '100000', '-l', '1000', '-r', '100', '-b', w1, w2]
        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        
        lines = res.stdout.split('\n')
        for line in lines:
            if line.startswith('Results:'):
                parts = line.strip().split()
                w1_wins = int(parts[1])
                w2_wins = int(parts[2])
                ties = int(parts[3])
                scores[w1] += w1_wins * 3 + ties
                scores[w2] += w2_wins * 3 + ties

print("Final Scores:")
sorted_scores = sorted(scores.items(), key=lambda x: x[1], reverse=True)
for i, (name, score) in enumerate(sorted_scores):
    print(f"{i+1}. {name}: {score}")
