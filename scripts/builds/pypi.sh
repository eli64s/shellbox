#!/usr/bin/env bash

set -eo pipefail

PYPI_API_KEY="$1"

if [ -z "$PYPI_API_KEY" ]; then
    echo "Please provide your PyPI API key as an argument."
    exit 1
fi

API_KEY="$PYPI_API_KEY"
PACKAGE="readmeai"
REPOSITORY="https://upload.pypi.org/legacy/"
USERNAME="__token__"

function clean {
    bash scripts/common/clean.sh
}

function build {
    python -m build
}

function upload {
    twine upload --verbose \
    --repository-url "$REPOSITORY" \
    --username "$USERNAME" \
    --password "$API_KEY" \
    dist/*
}

function main {

    clean
    build

    echo "Uploading $PACKAGE distribution files"
    upload

    echo "Successfully deployed new version of $PACKAGE to PyPI"
}

main
