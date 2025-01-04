#!/usr/bin/env bash

set -euo pipefail

# Set empty values for variables initially, to be assigned from command line
REPO_NAME="pydantic-ai"
REPO_URL="https://github.com/pydantic/pydantic-ai"
OUTPUT_FILE="pydantic-ai-docs.md"
POSSIBLE_PATHS=(docs,https://github.com/pydantic/pydantic-ai/tree/main/docs/)
TO_SEARCH="*.md"

CURRENT_DIR=$(pwd)
TMP_DIR=$(mktemp -d)

usage() {
    echo ""
    echo "Usage: $0 [-r REPO_URL] [-p POSSIBLE_PATHS] [-o OUTPUT_FILE] [-n REPO_NAME] [-s TO_SEARCH]"
    echo "  -r REPO_URL       URL of the GitHub repository to clone (required)"
    echo "  -p POSSIBLE_PATHS Comma-separated list of possible paths to search for markdown files (required)"
    echo "  -o OUTPUT_FILE    Name of the output markdown file (required)"
    echo "  -n REPO_NAME      Name of the repository (required)"
    echo "  -s TO_SEARCH      Pattern to search for markdown files (e.g., \"*.md\") (required)"
    exit 1
}

# Parse command-line arguments
while getopts "r:p:o:n:s:h" opt; do
    case ${opt} in
        r) REPO_URL=$OPTARG ;;
        p) IFS=',' read -r -a POSSIBLE_PATHS <<< "$OPTARG" ;;
        o) OUTPUT_FILE=$OPTARG ;;
        n) REPO_NAME=$OPTARG ;;
        s) TO_SEARCH=$OPTARG ;;
        h) usage ;;
        *) usage ;;
    esac
done

# Ensure required arguments are set
if [ -z "$REPO_URL" ] || [ -z "$OUTPUT_FILE" ] || [ -z "$REPO_NAME" ] || [ ${#POSSIBLE_PATHS[@]} -eq 0 ] || [ -z "$TO_SEARCH" ]; then
    usage
    exit 1
fi

cleanup() {
    echo "Cleaning up temporary directory..."
    rm -rf "$TMP_DIR"
}

recursive_search() {
    echo "Searching for Markdown files in $1..."
    find "$1" -type f -name "$TO_SEARCH"
}

trap cleanup EXIT

echo "Cloning repository..."
git clone --depth 1 "$REPO_URL" "$TMP_DIR/$REPO_NAME"

if [ ! -d "$TMP_DIR/$REPO_NAME" ]; then
    echo "Error: Failed to clone the repository. Check your internet connection and the repository URL."
    exit 1
fi

echo "Repository cloned successfully."
echo "Contents of $TMP_DIR/$REPO_NAME:"
ls -la "$TMP_DIR/$REPO_NAME"

CORRECT_PATH=""
for path in "${POSSIBLE_PATHS[@]}"; do
    if [ -d "$TMP_DIR/$REPO_NAME/$path" ]; then
        CORRECT_PATH="$path"
        break
    fi
done

if [ -z "$CORRECT_PATH" ]; then
    echo "Warning: Could not find any of the predefined paths. Searching for Markdown files in the entire repository..."
    MARKDOWN_FILES=$(recursive_search "$TMP_DIR/$REPO_NAME")
else
    echo "Found correct path: $CORRECT_PATH"
    MARKDOWN_FILES=$(recursive_search "$TMP_DIR/$REPO_NAME/$CORRECT_PATH")
fi

if [ -z "$MARKDOWN_FILES" ]; then
    echo "Error: No Markdown files found in the repository. Here's the repository structure:"
    tree -L 3 "$TMP_DIR/$REPO_NAME" || ls -R "$TMP_DIR/$REPO_NAME"
    exit 1
else
    echo "Found Markdown files in the following locations:"
    echo "$MARKDOWN_FILES"
fi

echo "Concatenating files..."
if [ -n "$MARKDOWN_FILES" ]; then
    > "$TMP_DIR/$OUTPUT_FILE"

    find "$TMP_DIR/$REPO_NAME" -type f -name "$TO_SEARCH" | while IFS= read -r file; do
        if [ -f "$file" ]; then
            echo "Adding content from $file"
            filename=$(basename "$file" .rst)
            echo -e "\n\n## $filename\n" >> "$TMP_DIR/$OUTPUT_FILE"
            cat "$file" >> "$TMP_DIR/$OUTPUT_FILE"
            echo -e "\n---" >> "$TMP_DIR/$OUTPUT_FILE"
        else
            echo "Warning: File $file not found or not accessible"
        fi
    done

    mv "$TMP_DIR/$OUTPUT_FILE" "$CURRENT_DIR/" || echo "Failed to move $OUTPUT_FILE to $CURRENT_DIR"
    echo "All files have been concatenated into $CURRENT_DIR/$OUTPUT_FILE"
else
    echo "No Markdown files found to concatenate."
fi
