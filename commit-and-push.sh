#!/bin/bash
set -e

echo "🔍 Preparing to commit and push TinaCMS migration changes..."
echo "----------------------------------------"

# Check if there are changes to commit
if [ -z "$(git status --porcelain)" ]; then
  echo "✅ No changes to commit. Working directory is clean."
  exit 0
fi

# Show changes to be committed
echo "📋 Changes to be committed:"
git status --short

# Confirm with user
read -p "Do you want to commit these changes? (y/n): " confirm
if [[ $confirm != "y" && $confirm != "Y" ]]; then
  echo "❌ Commit aborted."
  exit 1
fi

# Commit changes
echo "📝 Committing changes..."
git add .
git commit -m "Migrate from Sanity CMS to TinaCMS"

# Push changes
echo "🚀 Pushing changes to remote repository..."
git push

echo "✅ Changes successfully committed and pushed!"
echo "----------------------------------------"
