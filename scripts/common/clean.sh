#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e
# Treat unset variables as an error.
set -u
# Exit if any command in a pipeline fails.
set -o pipefail

usage() {
    echo "Usage: $0 [options] <command(s)>"
    echo
    echo "Commands:"
    echo "  clean                 Clean all build, test, coverage, and Python artifacts."
    echo "  clean-build           Clean build artifacts."
    echo "  clean-pyc             Clean Python file artifacts."
    echo "  clean-test            Clean test and coverage artifacts."
    echo "  clean-backup-cache    Clean backup files and cache directories."
    echo
    echo "Options:"
    echo "  -h, --help            Display this help message."
    echo "  -v, --verbose         Enable verbose output."
    echo "  -n, --dry-run         Show what would be done without actually deleting."
    exit 1
}

# Initialize flags.
VERBOSE=0
DRY_RUN=0

# Parse options.
while [[ $# -gt 0 && "$1" == -* ]]; do
    case "$1" in
        -h | --help)
            usage
        ;;
        -v | --verbose)
            VERBOSE=1
            shift
        ;;
        -n | --dry-run)
            DRY_RUN=1
            shift
        ;;
        *)
            echo "Unknown option: $1"
            usage
        ;;
    esac
done

# Function to perform deletion with optional dry-run and verbose output.
delete() {
    local cmd="rm -rf"
    if [[ $DRY_RUN -eq 1 ]]; then
        cmd="echo rm -rf"
        elif [[ $VERBOSE -eq 1 ]]; then
        cmd="rm -rfv"
    fi
    $cmd "$@"
}

# Function to find and delete files/directories.
find_delete() {
    local path="$1"
    shift
    local args="$@"
    if [[ $DRY_RUN -eq 1 ]]; then
        echo find "$path" $args -exec rm -rf {} +
    else
        if [[ $VERBOSE -eq 1 ]]; then
            find "$path" $args -exec rm -rfv {} +
        else
            find "$path" $args -exec rm -rf {} +
        fi
    fi
}

# Define cleaning functions.
clean_all() {
    clean_build
    clean_pyc
    clean_test
    clean_backup_cache
    echo "All build, test, coverage, and Python artifacts have been removed."
}

clean_build() {
    echo "Removing build artifacts..."
    delete build/ dist/ .eggs/ site/ .p
    find_delete . \( -name '*.egg-info' -o -name '*.egg' \)
}

clean_pyc() {
    echo "Removing Python file artifacts..."
    find_delete . \( -name '*.pyc' -o -name '*.pyo' -o -name '*~' -o -name '__pycache__' \)
}

clean_test() {
    echo "Removing test and coverage artifacts..."
    delete .coverage coverage.* .nox/ .tox/ htmlcov/
}

clean_backup_cache() {
    echo "Removing backup files and cache directories..."
    delete .mypy_cache/ .pytest_cache/ .ruff_cache/
    find_delete . -type f \( -name '*.py-e' -o -name '*.DS_Store' -o -name '*.py[co]' \)
    echo "Removing cache directories..."
    find_delete . -type d \( -name '__pycache__' -o -name '.ipynb_checkpoints' \)
}

# If no command is given, show usage.
if [[ $# -eq 0 ]]; then
    usage
fi

# Iterate over all commands.
for cmd in "$@"; do
    case "$cmd" in
        clean)
            clean_all
        ;;
        clean-build)
            clean_build
        ;;
        clean-pyc)
            clean_pyc
        ;;
        clean-test)
            clean_test
        ;;
        clean-backup-cache)
            clean_backup_cache
        ;;
        *)
            echo "Unknown command: $cmd"
            usage
        ;;
    esac
done
