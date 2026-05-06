import os
import subprocess

# Tournament Parameters
CORESIZE = 8192
PROCESSES = 64
CYCLES = 50000
ROUNDS = 200 # As per tournament page

warriors = [
    "lux2.red",
    "sturmunddrang.red",
    "panca1.red"
]

warrior_dir = "../../../warriors/tournaments/ti1988"
pmars_path = "../../../src/pmars"

scores = {w: 0 for w in warriors}

print(f"Simulating Primo Torneo Italiano di Core Wars (1988)")
print(f"Parameters: -s {CORESIZE} -p {PROCESSES} -c {CYCLES} -r {ROUNDS} -8 -f")

for i in range(len(warriors)):
    for j in range(i + 1, len(warriors)):
        w1_name = warriors[i]
        w2_name = warriors[j]
        w1 = os.path.join(warrior_dir, w1_name)
        w2 = os.path.join(warrior_dir, w2_name)
        
        cmd = [pmars_path, "-8", "-f", "-s", str(CORESIZE), "-p", str(PROCESSES), "-c", str(CYCLES), "-r", str(ROUNDS), w1, w2]
        
        # print(f"Running: {' '.join(cmd)}")
        res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        
        # Parse results
        # Example: Results: 146 39 15
        for line in res.stdout.split('\n'):
            if line.startswith('Results:'):
                parts = line.strip().split()
                w1_wins = int(parts[1])
                w2_wins = int(parts[2])
                ties = int(parts[3])
                
                scores[w1_name] += w1_wins * 3 + ties
                scores[w2_name] += w2_wins * 3 + ties
                break

print("\n--- Final Results ---")
sorted_scores = sorted(scores.items(), key=lambda x: x[1], reverse=True)
for i, (name, score) in enumerate(sorted_scores):
    print(f"{i+1}. {name}: {score} points")

# Verification
winner = sorted_scores[0][0]
if winner == "lux2.red":
    print("\nSUCCESS: Lux 2 is the winner, matching historical results!")
else:
    print(f"\nNOTE: Winner is {winner}. Historically, Lux 2 won.")
