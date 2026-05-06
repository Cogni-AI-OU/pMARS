import os
import subprocess
import sys

def run_test():
    pmars = "../../../src/pmars"
    warrior_dir = "../../../warriors/tournaments/kofacoto/round7"
    w1 = os.path.join(warrior_dir, "Macrae.red")
    w2 = os.path.join(warrior_dir, "Janeczek.red")

    if not os.path.exists(pmars):
        # try bin/pmars
        pmars = "../../../bin/pmars"
        if not os.path.exists(pmars):
            print(f"Error: pmars not found")
            return False

    # Round 7 parameters
    # -8: ICWS'88 rules
    # -f: fixed seed for determinism
    # -s 8000: core size
    # -p 8: max processes
    # -c 80000: cycles
    # -r 1000: rounds
    # -l 100: max warrior length
    # -d 100: min distance
    cmd = [pmars, "-8", "-f", "-s", "8000", "-p", "256", "-c", "80000", "-r", "1000", "-l", "100", "-d", "100", "-b", w1, w2]
    
    print(f"Running Round 7: {' '.join(cmd)}")
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    
    print(res.stdout)
    
    if res.returncode != 0:
        print("Error running pmars")
        return False

    # Expected: Results: 14 1 985
    # Macrae (w1) 14 wins, Janeczek (w2) 1 win, 985 ties
    for line in res.stdout.split('\n'):
        if line.startswith('Results:'):
            parts = line.strip().split()
            w1_wins = int(parts[1])
            w2_wins = int(parts[2])
            ties = int(parts[3])
            
            print(f"Detected Results: {w1_wins} {w2_wins} {ties}")
            
            if w1_wins == 14 and w2_wins == 1 and ties == 985:
                print("SUCCESS: Results match historical data!")
                return True
            else:
                print(f"FAILURE: Expected 14 1 985, got {w1_wins} {w2_wins} {ties}")
                return False
    
    print("Could not find Results line in output")
    return False

if __name__ == "__main__":
    if run_test():
        sys.exit(0)
    else:
        sys.exit(1)
