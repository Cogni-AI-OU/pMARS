import os
import subprocess


BASE_DIR = os.path.dirname(os.path.abspath(__file__))
warrior_dir = os.path.normpath(os.path.join(BASE_DIR, '../../../warriors/tournaments/maniacs1998/round4'))
warriors = ['carbonite.red', 'mini_hsa.red', 'timescape.red']

print("Simulating Redcode Maniacs Tournament Round 4 Components (Deterministic Subset)...")
print("Settings: 8000 core, 8000 processes, 80000 cycles, 200 rounds, ICWS'94")


def run_match(w1_name, w2_name):
    w1 = os.path.join(warrior_dir, w1_name)
    w2 = os.path.join(warrior_dir, w2_name)
    cmd = [
        os.path.normpath(os.path.join(BASE_DIR, '../../../src/pmars')),
        '-f',
        '-s', '8000',
        '-p', '8000',
        '-c', '80000',
        '-d', '100',
        '-l', '100',
        '-r', '200',
        '-b',
        w1,
        w2,
    ]
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)

    for line in res.stdout.splitlines():
        if line.startswith('Results:'):
            parts = line.split()
            return int(parts[1]), int(parts[2]), int(parts[3])

    raise AssertionError(f'No Results line for {w1_name} vs {w2_name}:\n{res.stdout}')


scores = {w: 0 for w in warriors}

for i in range(len(warriors)):
    for j in range(i + 1, len(warriors)):
        w1_name = warriors[i]
        w2_name = warriors[j]
        w1_wins, w2_wins, ties = run_match(w1_name, w2_name)
        scores[w1_name] += w1_wins * 3 + ties
        scores[w2_name] += w2_wins * 3 + ties

print("\n--- Final Results ---")
sorted_scores = sorted(scores.items(), key=lambda item: item[1], reverse=True)
for i, (name, score) in enumerate(sorted_scores):
    print(f"{i+1}. {name}: {score} points")

winner = sorted_scores[0][0]
print("\nDeterministic Winner Check:")
if winner == 'timescape.red':
    print("SUCCESS: Timescape is the winner in this subset, matching regression fixture expectation!")
else:
    print(f"NOTE: Simulated winner is {winner}. Expected timescape.red for this subset.")

assert winner == 'timescape.red', sorted_scores
