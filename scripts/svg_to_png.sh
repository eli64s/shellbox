#!/bin/bash

for file in assets/img/*.png; do
    filename=$(basename "$file")
    ffmpeg -i "$file" -vf "scale=iw*0.3:-1" -compression_level 9 -quality 40 -frames:v 1 -update 1 "assets/img/compressed-$filename"
done

for file in assets/img/compressed-*.png; do
    mv "$file" "${file/compressed-/}"
done
