#!/bin/bash
# Auto commit script

# Navigate to the project directory
cd $(dirname "$0")

# Fetch latest changes
if git fetch --dry-run 2>/dev/null; then
  echo "Repository is up to date or there are new changes."
else
  echo "Could not fetch changes. Please check your network connection."
  exit 1
fi

# Add all changes
if git diff-index --quiet HEAD --; then
  echo "No changes to commit."
else
  git add .
  echo "All changes added to staging."

  # Commit changes
  commit_message="Auto commit on $(date)"
  git commit -m "$commit_message"
  echo "Changes committed with message: '$commit_message'"
fi

# Push changes
if git push; then
  echo "Changes pushed successfully."
else
  echo "Failed to push changes. Please resolve any issues and try again."
  exit 1
fi
