#!/bin/bash

# Path to your local Git repository
REPO_DIR="/Users/noahcasarotto-dinning/Downloads/Arvo/github_aurora/Github"

cd "$REPO_DIR" || {
  echo "Error: Cannot find repo directory at $REPO_DIR"
  exit 1
}

# File to update daily
UPDATE_FILE="daily_update.txt"

# Create the file if it doesn't exist
if [ ! -f "$UPDATE_FILE" ]; then
    touch "$UPDATE_FILE"
fi

# Append current date/time to force a change
echo "Update on $(date)" >> "$UPDATE_FILE"

# Stage changes
git add "$UPDATE_FILE"

# Commit with a timestamp
git commit -m "Daily commit: $(date)"

# Push to the remote (adjust branch if not 'main')
git push origin main

