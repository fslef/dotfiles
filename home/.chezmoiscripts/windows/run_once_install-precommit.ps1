# Exit on error
$ErrorActionPreference = "Stop"

# Check if pre-commit is installed
if (-not (Get-Command pre-commit -ErrorAction SilentlyContinue)) {
    Write-Error "pre-commit is not installed. Please ensure it's installed via packages.toml first."
    exit 1
}

# Install git hooks
pre-commit install

# Run pre-commit against all files
pre-commit run --all-files

Write-Host "Pre-commit setup completed successfully!"