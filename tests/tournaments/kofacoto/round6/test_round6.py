import os
import subprocess
import glob

# KOFACOTO Round 6: Semi-finals
# Coresize: 55440, Max processes: 55440, Cycles: 500000, Standard: 94x
# Battles:
# 1. Michal Janeczek (jan.red) vs Christian Schmidt (schmidt.red)
# 2. Robert Macrae (macrae.red) vs David Moore (moore.red)

battles = [
    ("jan.red", "schmidt.red", "Michal Janeczek"),
    ("macrae.red", "moore.red", "Robert Macrae")
]

warrior_dir = '../../../../warriors/tournaments/kofacoto/round6'
pmars_path = '../../../../src/pmars'

print("Simulating KOFACOTO Round 6 (Semi-finals)...")
print("Settings: 55440 core, 55440 processes, 500000 cycles, 250 rounds, ICWS'94x")
print("Format: Head-to-head matches (Deterministic: -f flag)")

all_passed = True

for w1_name, w2_name, expected_winner in battles:
    w1 = os.path.join(warrior_dir, w1_name)
    w2 = os.path.join(warrior_dir, w2_name)
    
    # cmd = [pmars_path, '-f', '-x', '-s', '55440', '-p', '55440', '-c', '500000', '-r', '250', '-b', w1, w2]
    # cmd = [pmars_path, '-f', '-s', '55440', '-p', '55440', '-c', '500000', '-r', '250', '-b', w1, w2]
    cmd = [pmars_path, '-f', '-s', '55440', '-p', '55440', '-c', '500000', '-r', '250', '-l', '500', '-b', w1, w2]
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    
    w1_wins = 0
    w2_wins = 0
    ties = 0
    
    lines = res.stdout.split('\n')
    for line in lines:
        if line.startswith('Results:'):
            parts = line.strip().split()
            w1_wins = int(parts[1])
            w2_wins = int(parts[2])
            ties = int(parts[3])
    
    print(f"\nMatch: {w1_name} vs {w2_name}")
    print(f"Results: {w1_name} {w1_wins}, {w2_name} {w2_wins}, Ties {ties}")
    
    if w1_wins > w2_wins:
        actual_winner = "Michal Janeczek" if "jan" in w1_name else "Robert Macrae"
    elif w2_wins > w1_wins:
        actual_winner = "Christian Schmidt" if "schmidt" in w2_name else "David Moore"
    else:
        actual_winner = "Tie"
    
    print(f"Winner: {actual_winner} (Expected: {expected_winner})")
    
    if actual_winner != expected_winner:
        print(f"FAILURE: Result does not match historical winner!")
        all_passed = False
    else:
        print(f"SUCCESS: Result matches historical winner.")

print("\n--- Summary ---")
if all_passed:
    print("ALL TESTS PASSED")
    exit(0)
else:
    print("SOME TESTS FAILED")
    exit(1)
