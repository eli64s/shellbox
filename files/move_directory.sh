#!/bin/bash

folder_name="GitHub/readme-ai/docs/archive"

destination="Documents/folder"

if [[ -d "$folder_name" ]]; then
    if [[ -d "$destination" ]]; then
        mv "$folder_name" "$destination"
        echo "Folder moved successfully to $destination"
    else
        echo "Destination directory does not exist: $destination"
    fi
else
    echo "Folder does not exist: $folder_name"
fi
