#!/usr/bin/env bash

# Determine the operating system type
if [[ "$(uname -s)" == "Linux" ]]; then
    OS="linux"
elif [[ "$(uname -s)" == "Darwin" ]]; then
    OS="macos"
else
    echo "Error: Unsupported operating system."
    exit 1
fi

# Download the latest version of Micromamba for the current OS
curl -L "https://micromamba.snakepit.net/api/micromamba/$OS-64/latest" --output micromamba

# Make the downloaded file executable
chmod +x micromamba

# Move Micromamba to /usr/local/bin so that it can be run from anywhere
sudo mv micromamba /usr/local/bin/

# Initialize Micromamba
micromamba shell init -s bash -p /usr/local/micromamba

# Configure Micromamba to use the conda-forge channel by default
micromamba config --add channels conda-forge
micromamba config --set channel_priority strict

echo "Micromamba installation and setup complete!"
