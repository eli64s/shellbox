#!/usr/bin/env bash

set -e

create_structure() {
    local base_dir="$1"
    shift
    local items=("$@")

    for item in "${items[@]}"; do
        if [[ "$item" == */ ]]; then
            mkdir -p "${base_dir}/${item}"
        else
            mkdir -p "$(dirname "${base_dir}/${item}")"
            touch "${base_dir}/${item}"
        fi
    done
}

read -rp "Enter the base directory to create the structure: " base_dir

structure=(
    "markdown-guide/"
    "markdown-guide/README.md"
    "markdown-guide/line-separators.md"
    "markdown-guide/lists.md"
    "markdown-guide/tables/"
    "markdown-guide/tables/alignment.md"
    "markdown-guide/tables/multi-line-cells.md"
    "markdown-guide/tables/task-lists.md"
    "markdown-guide/tables/merged-cells.md"
    "markdown-guide/text-styling/"
    "markdown-guide/text-styling/basic-formatting.md"
    "markdown-guide/text-styling/progress-bars.md"
    "markdown-guide/text-styling/highlighting.md"
    "markdown-guide/text-styling/underlining.md"
    "markdown-guide/buttons-and-shortcuts.md"
    "markdown-guide/math-equations.md"
    "markdown-guide/images/"
    "markdown-guide/images/centered-images.md"
    "markdown-guide/images/aligned-images.md"
    "markdown-guide/images/small-images.md"
    "markdown-guide/images/text-boxes.md"
    "markdown-guide/images/text-wrapping.md"
    "markdown-guide/mermaid-diagrams.md"
    "markdown-guide/links/"
    "markdown-guide/links/inline-links.md"
    "markdown-guide/links/reference-links.md"
    "markdown-guide/contact-info.md"
    "markdown-guide/contributing.md"
    "markdown-guide/footnotes.md"
    "markdown-guide/html-elements/"
    "markdown-guide/html-elements/spacing-entities.md"
)

create_structure "$base_dir" "${structure[@]}"

echo "Directory structure created successfully in $base_dir"
