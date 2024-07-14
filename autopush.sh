#!/bin/bash

# Variables
REPO_DIR="/mnt/d/learngit/"     # Path to your repository
REMOTE_URL="https://github.com/arunchy/newrepo.git"  # URL of your repository
BRANCH_NAME="master"                # Branch name to push to
COMMIT_MESSAGE="auto commit"      # Commit message

# Function to initialize, add remote, and push changes
push_changes() {
  cd "$REPO_DIR" || exit

  # Check if .git directory exists
  if [ ! -d ".git" ]; then
    echo "Initializing a new Git repository..."
    git init
  else
    echo "Git repository already initialized."
  fi

  # Add changes to staging
  git add .

  # Check if remote URL is already added
  if git remote | grep -q 'origin'; then
    echo "Remote URL already added."
  else
    echo "Adding remote URL..."
    git remote add origin "$REMOTE_URL"
  fi

  # Commit changes
  git commit -m "$COMMIT_MESSAGE"

  # Push to the repository
  git push -u origin "$BRANCH_NAME"
}

# Execute the function
push_changes
