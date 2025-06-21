import os
import re

file_path = 'fxmanifest.lua'

with open(file_path, 'r') as f:
    contents = f.read()

match = re.search(r"version\s*'([0-9]+)\.([0-9]+)\.([0-9]+)'", contents)
if not match:
    print('Version not found')
    exit(1)

major, minor, patch = map(int, match.groups())
patch += 1
new_version = f"{major}.{minor}.{patch}"
new_contents = re.sub(r"version\s*'[0-9]+\.[0-9]+\.[0-9]+'", f"version '{new_version}'", contents)

with open(file_path, 'w') as f:
    f.write(new_contents)

print(f"Bumped version to {new_version}")
if 'GITHUB_OUTPUT' in os.environ:
    with open(os.environ['GITHUB_OUTPUT'], 'a') as f:
        f.write(f"version={new_version}\n")
