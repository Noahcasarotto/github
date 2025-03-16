#!/bin/bash

# Auto commit script
# This script automatically commits changes daily and weekly based on the specified criteria.

# Get the current day of the week
DAY_OF_WEEK=$(date +%u)

# Define the commit message
if [ "$DAY_OF_WEEK" -eq 1 ]; then
    COMMIT_MESSAGE="Weekly update"
else
    COMMIT_MESSAGE="Daily update"
fi

# Add all changes to git
cd $(dirname "$0")/..
git add .

# Commit the changes
if [ -n "$(git status --porcelain)" ]; then
    git commit -m "$COMMIT_MESSAGE"
    echo "Changes committed with message: $COMMIT_MESSAGE"
else
    echo "No changes to commit."
fi

# Push changes to the remote repository
git push origin main
