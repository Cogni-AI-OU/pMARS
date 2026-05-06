import unittest
import subprocess
import os

class TestEBS1991(unittest.TestCase):
    def test_simulation(self):
        script_path = os.path.join(os.path.dirname(__file__), "simulate.sh")
        result = subprocess.run(["bash", script_path], capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, f"Simulation failed: {result.stderr}")
        self.assertIn("SUCCESS: XTC is the winner", result.stdout)

if __name__ == "__main__":
    unittest.main()
