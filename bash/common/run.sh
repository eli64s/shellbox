#!/usr/bin/env bash

set -eo pipefail

echo "Execution started: $(date)"

echo "Activating conda environment..."
eval "$(conda shell.bash hook)"
conda activate my_env

echo "Upgrading pip..."
python -m pip install --upgrade pip

echo "Execution complete: $(date)"
