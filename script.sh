#!/bin/bash

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory_name> <size>"
    exit 1
fi

# Assign arguments to variables
directory="$1"
size="$2"

# Create the output directory
output_dir="output"
mkdir -p "$output_dir"

# Convert HEIC to JPEG and resize
for file in "$directory"/*.{heic,HEIC}; do
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        filename_noext="${filename%.*}"

        # Convert HEIC to JPEG
        sips -s format jpeg "$file" --out "$output_dir/$filename_noext.jpg"
        
        # Resize JPEG
        sips --resampleWidth $size "$output_dir/$filename_noext.jpg" --out "$output_dir/$filename_noext.jpg"
    fi
done

# Resize other image formats
for file in "$directory"/*.{jpg,JPG,jpeg,JPEG,png,PNG,gif,GIF}; do
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        filename_noext="${filename%.*}"

        # Resize image
        sips --resampleWidth $size "$file" --out "$output_dir/$filename_noext.jpg"
    fi
done

