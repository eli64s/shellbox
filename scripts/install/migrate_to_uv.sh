#!/usr/bin/env bash

set -e

# Function to display informational messages
echo_info() {
    echo -e "\033[1;34m[INFO]\033[0m $1"
}

# Function to display error messages
echo_error() {
    echo -e "\033[1;31m[ERROR]\033[0m $1"
}

# Check if pyproject.toml exists
if [ ! -f pyproject.toml ]; then
    echo_error "pyproject.toml not found in the current directory."
    exit 1
fi

# # Update 'pyproject.toml' for flat layout
# echo_info "Updating 'pyproject.toml' for flat layout..."

# # Backup original pyproject.toml
# cp pyproject.toml pyproject.toml.bak

# # Remove existing setuptools configurations
# sed -i.bak '/^\[tool\.setuptools\]/,/^\[.*\]/d' pyproject.toml
# sed -i.bak '/^\[tool\.setuptools\.packages\.find\]/,/^\[.*\]/d' pyproject.toml

# # Append new setuptools configuration
# cat <<EOT >> pyproject.toml

# [tool.setuptools.packages.find]
# where = ["."]
# include = ["."]
# exclude = [
#     "notebooks",
#     "tests",
#     "site",
#     "setup",
# ]
# EOT

# echo_info "'pyproject.toml' updated for flat layout."

# # Install your package using uv
# echo_info "Installing the package using uv..."
# uv pip install -e ".[dev,test,docs]"

# # Verify the installation
# echo_info "Verifying the installation..."
# if command -v readmeai >/dev/null 2>&1; then
#     echo_info "'readmeai' command is available."
#     readmeai --help
# else
#     echo_error "'readmeai' command not found after installation."
#     exit 1
# fi

# echo_info "Setup completed successfully with flat layout."
