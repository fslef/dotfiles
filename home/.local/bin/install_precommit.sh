#!/bin/bash

# Exit on error
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install pre-commit based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if ! command_exists brew; then
        echo "Homebrew is not installed. Please install it first."
        exit 1
    fi
    brew install pre-commit
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows
    if ! command_exists choco; then
        echo "Chocolatey is not installed. Please install it first."
        exit 1
    fi
    choco install pre-commit -y
else
    # Linux
    if ! command_exists pip3; then
        echo "pip3 is not installed. Please install it first."
        exit 1
    fi
    pip3 install pre-commit
fi

# Install git hooks
pre-commit install

# Run pre-commit against all files
pre-commit run --all-files

echo "Pre-commit setup completed successfully!"