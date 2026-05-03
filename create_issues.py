import re
import subprocess
import os
import time

with open("tournaments.txt", "r") as f:
    content = f.read()

BASE_URL = "https://corewar.co.uk/"

def make_absolute(url):
    if url.startswith("http"):
        return url
    return BASE_URL + url

lines = [l.strip() for l in content.strip().split("\n") if l.strip()]

for line in lines:
    # Try to find all markdown links
    links = re.findall(r'\[([^\]]+)\]\(([^)]+)\)', line)
    if not links:
        continue
    
    # Extract tournament name - usually the first link text or the whole line before first colon
    first_link_text, first_link_url = links[0]
    
    # If the line contains more text after the link (like '88 Tournament), include it
    title_match = re.search(r'\[[^\]]+\]\([^)]+\)\s*([^:(]+)', line)
    suffix = ""
    if title_match:
        suffix = title_match.group(1).strip()
    
    tournament_name = first_link_text
    if suffix:
        tournament_name += " " + suffix
        
    # Build links list for the body
    body_links = []
    for text, url in links:
        abs_url = make_absolute(url)
        body_links.append(f"[{text}]({abs_url})")
    
    body = f"""## Tournament: {tournament_name}
Links:
{chr(10).join("- " + l for l in body_links)}

- [ ] Add warriors
- [ ] Revise warriors
- [ ] Add results
- [ ] Revise results
"""

    issue_title = f"Tournament Integration: {tournament_name}"
    
    print(f"Creating issue: {issue_title}")
    
    # Create issue using gh api
    subprocess.run([
        "gh", "api", "repos/Cogni-AI-OU/pMARS/issues",
        "-f", f"title={issue_title}",
        "-f", f"body={body}",
        "-F", "labels[]=tournament"
    ], check=True)
    
    # Sleep a bit to avoid hitting rate limits too fast (though 40 is usually fine)
    time.sleep(1)
