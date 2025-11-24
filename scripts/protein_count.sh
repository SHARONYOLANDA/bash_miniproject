#!/usr/bin/bash

# Usage: ./protein_count.sh <data_directory>
DATA_DIR="$1"
RESULTS_DIR="../results"

# Input protein file
PROTEIN_FILE="$DATA_DIR/humchrx.txt"

# Output file
OUTPUT="$RESULTS_DIR/protein_count.txt"

# Check if input file exists
if [ ! -f "$PROTEIN_FILE" ]; then
    echo "ERROR: Protein file not found at $PROTEIN_FILE"
    exit 1
fi

# Count protein entries
# Assuming protein entries start at line 74 and ignoring lines starting with '-'
protein_count=$(tail -n +74 "$PROTEIN_FILE" | grep -v '^-' | wc -l)

# Save count to output file
echo "$protein_count" > "$OUTPUT"

echo "Total protein entries saved to $OUTPUT"

