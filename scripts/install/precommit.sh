#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to print informational messages.
echo_info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

echo_info "Setting up pre-commit hooks..."

ig
pre-commit autoupdate

# Check if pre-commit is installed.
if ! command -v pre-commit &> /dev/null; then
    echo_info "pre-commit is not installed. Installing..."
    if command -v pip &> /dev/null; then
        pip install pre-commit
    else
        echo "pip is not installed. Please install pip and rerun the script."
        exit 1
    fi
fi

# Install and run pre-commit hooks.
pre-commit install
pre-commit run --all-files
