#!/bin/bash

set -eo pipefail

# If you need to export environment variables, do it here
# export API_KEY=""

# Activate the conda environment
eval "$(conda shell.bash hook)"
conda activate my_env

# Run the Python script
python src/main.py