#!/bin/bash

# Exit on error
set -e

# Check if pre-commit is installed
if ! command -v pre-commit >/dev/null 2>&1; then
    echo "pre-commit is not installed. Please ensure it's installed via packages.toml first."
    exit 1
fi

# Install git hooks
pre-commit install

# Run pre-commit against all files
pre-commit run --all-files

echo "Pre-commit setup completed successfully!"