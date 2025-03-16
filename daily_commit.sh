#!/bin/bash

# Navigate to the project directory
cd /Users/noahcasarotto-dinning/Downloads/Arvo/github_aurora/Github

# Pull the latest changes
if git pull origin main; then
  echo "Successfully pulled the latest changes."
else
  echo "Failed to pull the latest changes." >&2
  exit 1
fi

# Add all changes to the commit
if git add .; then
  echo "Staged all changes."
else
  echo "Failed to stage changes." >&2
  exit 1
fi

# Get the current date
date=$(date +"%Y-%m-%d")

# Commit the changes with a daily message
if git commit -m "Daily update on $date"; then
  echo "Committed changes."
else
  echo "Failed to commit changes." >&2
  exit 1
fi

# Push the changes to the repository
if git push origin main; then
  echo "Successfully pushed changes to the repository."
else
  echo "Failed to push changes." >&2
  exit 1
fi

# Log the commit to daily_update.txt
echo "Daily update committed on $date" >> daily_update.txt
