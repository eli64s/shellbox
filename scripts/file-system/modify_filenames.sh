#!/usr/bin/env bash

set -eo pipefail

folder_path="/GitHub/readme-ai-streamlit/docs"

cd "$folder_path" || exit

function rename_files() {
    folder_path="$1"

    cd "$folder_path" || exit

    for file in *; do
        if [[ -f $file ]]; then

            # Convert the filename to lowercase
            lowercase_name=$(echo "$file" | tr '[:upper:]' '[:lower:]' | tr '_' '-')

            # Check if the filename is different
            if [[ $file != $lowercase_name ]]; then
                mv "$file" "$lowercase_name"
                echo "Renamed: $file -> $lowercase_name"
            fi
        fi
    done
}
