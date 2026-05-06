import subprocess
import sys
import os

warriors = [
    ("Retribution", "Retribution.red"),
    ("myEchelon", "myEchelon.red"),
    ("DialHForHero", "DialHForHero.red"),
    ("Round4_2000", "Round4_2000.red"),
    ("SAS", "SAS.red"),
    ("RescueTeam", "RescueTeam.red"),
    ("Splitter", "Splitter.red"),
    ("PMdoRio", "PMdoRio.red"),
    ("SaturdayAfternoonSoldiers", "SaturdayAfternoonSoldiers.red"),
    ("lame_killa", "lame_killa.red"),
    ("x1_47", "x1_47.red"),
    ("KamikazeCrazy", "KamikazeCrazy.red"),
]

cia = "CIA.red"
jedimp = "EvilJedimps.red"

# Tournament parameters
rounds = 1000
pmars_path = "../../../../src/pmars"
warriors_dir = "../../../../warriors/tournaments/kofacoto/round4"

def run_match(warrior_file):
    cmd = [
        pmars_path, "-f", "-k", "-r", str(rounds),
        "-d", "100", "-c", "80000", "-p", "8000", "-l", "100",
        os.path.join(warriors_dir, warrior_file),
        os.path.join(warriors_dir, cia),
        os.path.join(warriors_dir, jedimp)
    ]
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error running pmars for {warrior_file}: {result.stderr}")
        return None
    
    lines = result.stdout.strip().split('\n')
    stats = []
    for line in lines[-3:]:
        parts = line.split()
        if len(parts) >= 5:
            stats.append({
                's1': int(parts[2]),
                's2': int(parts[3])
            })
    
    if len(stats) < 3:
        return 0
    
    w1_s1, w1_s2 = stats[0]['s1'], stats[0]['s2']
    w2_s1, w2_s2 = stats[1]['s1'], stats[1]['s2']
    w3_s1, w3_s2 = stats[2]['s1'], stats[2]['s2']
    
    # n12 = (W1.s1 + W2.s1 - W3.s1) / 2
    n12 = (w1_s1 + w2_s1 - w3_s1) // 2
    # n123 = W1.s2
    n123 = w1_s2
    
    score = n12 * 10 + n123 * 1
    return score

results = []
for name, file in warriors:
    # print(f"Simulating {name}...")
    score = run_match(file)
    results.append((name, score))

# Sort by score
results.sort(key=lambda x: x[1], reverse=True)

# Normalize to 1000
max_score = results[0][1]
normalized_results = []
for name, score in results:
    norm = int(score * 1000 / max_score) if max_score > 0 else 0
    normalized_results.append((name, score, norm))

print("\nKOFACOTO Round 4 Simulation Results:")
print(f"{'Rank':<5} {'Warrior':<30} {'Score':<10} {'Normalized':<10}")
for i, (name, score, norm) in enumerate(normalized_results, 1):
    print(f"{i:<5} {name:<30} {score:<10} {norm:<10}")

# Verification
expected_top_3 = ["Retribution", "myEchelon", "DialHForHero"]
actual_top_3 = [r[0] for r in normalized_results[:3]]

if actual_top_3 == expected_top_3:
    print("\nSUCCESS: Top 3 warriors match historical results!")
else:
    print("\nNOTICE: Top 3 warriors differ from historical results.")
    print(f"Expected: {expected_top_3}")
    print(f"Actual:   {actual_top_3}")
