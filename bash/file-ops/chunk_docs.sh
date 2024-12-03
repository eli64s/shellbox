#!/usr/bin/env bash

base_dir="pydantic/docs"
file_path="pydantic.md"
output_dir="$base_dir/chunks"

mkdir -p $output_dir

# Get the total number of lines in the document
total_lines=$(wc -l < $base_dir/$file_path)

# Calculate the number of lines per chunk
lines_per_chunk=$(( (total_lines + 9) / 10 ))

# Split the document into 10 parts, each with the calculated number of lines
split -l $lines_per_chunk $base_dir/$file_path $output_dir/chunk_

# Rename the chunks to have a .md extension
for file in $output_dir/chunk_*; do
    mv $file $file.md
done