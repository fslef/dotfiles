#!/bin/bash

# Exit on error
set -e

# Check if pre-commit is installed
if ! command -v pre-commit >/dev/null 2>&1; then
    echo "pre-commit is not installed. Please ensure it's installed via packages.toml first."
    exit 1
fi

# Check if git is installed
if ! command -v git >/dev/null 2>&1; then
    echo "git is not installed yet. Skipping pre-commit installation for now."
    echo "Please run this script again after git is installed."
    exit 0
fi

# Get the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

# Check if we're in a git repository, if not initialize one
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Initializing git repository in $DOTFILES_DIR"
    cd "$DOTFILES_DIR"
    git init
fi

# Install git hooks
pre-commit install

# Run pre-commit against all files
pre-commit run --all-files

echo "Pre-commit setup completed successfully!"