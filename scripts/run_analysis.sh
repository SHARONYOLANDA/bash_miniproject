#!/bin/bash

# MASTER ANALYSIS SCRIPT

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Validating argument and checking if data directory is provided
if [ -z "$1" ]; then
    echo "ERROR: No data directory provided."
    echo "Usage: $0 <data_directory>"
    exit 1
fi

DATA_DIR="$1"

# Checking that main FASTA file exists
FASTA_FILE="$DATA_DIR/IP-004_S38_L001_scaffolds.fasta"
if [ ! -f "$FASTA_FILE" ]; then
    echo "ERROR: FASTA file not found at: $FASTA_FILE"
    exit 1
fi

# Checking that protein file exists
PROTEIN_FILE="$DATA_DIR/humchrx.txt"
if [ ! -f "$PROTEIN_FILE" ]; then
    echo "ERROR: Protein file not found at: $PROTEIN_FILE"
    exit 1
fi

# making sure results directory exists
RESULTS_DIR="../results"
mkdir -p "$RESULTS_DIR"

echo
echo "      RUNNING FULL ANALYSIS    "


echo "Data directory: $DATA_DIR"
echo


# PART 1: FASTA EXPLORATION
echo "[1/3] Running FASTA exploration..."
bash ./extract_headers.sh "$DATA_DIR"
bash ./longest_sequence.sh "$DATA_DIR"
echo "FASTA exploration complete."
echo

# PART 2: SEQUENCE FILTERING
echo "[2/3] Running sequence filtering..."
bash ./filter_by_length.sh "$DATA_DIR"
bash ./high_quality_scaffolds.sh "$DATA_DIR"
echo "Sequence filtering complete."
echo

# PART 3: PROTEIN DATABASE ANALYSIS
echo "[3/3] Running protein database analysis..."
bash ./extract_genes.sh "$DATA_DIR"
bash ./search_proteins.sh "$DATA_DIR"
bash ./protein_count.sh "$DATA_DIR"
echo "Protein analysis complete."
echo

# FINAL SUMMARY
echo "Generating final summary..."

# File paths
seq_file="$RESULTS_DIR/sequence_ids.txt"
hq_file="$RESULTS_DIR/high_quality_scaffolds.txt"
protein_file="$RESULTS_DIR/protein_count.txt"

# Counting
total_sequences=$( [ -f "$seq_file" ] && wc -l < "$seq_file" || echo 0 )
high_quality=$( [ -f "$hq_file" ] && wc -l < "$hq_file" || echo 0 )
protein_entries=$( [ -f "$protein_file" ] && cat  "$protein_file" || echo 0 )

#Current date and time
timestamp=$(date)

#Writing summary to results
SUMMARY_FILE="$RESULTS_DIR/analysis_summary.txt"

{
    echo "   ANALYSIS SUMMARY   "
    echo "Total sequences in FASTA: $total_sequences"
    echo "High-quality scaffolds: $high_quality"
    echo "Total protein entries: $protein_entries"
    echo "Run date/time: $timestamp"
} > "$SUMMARY_FILE"

echo "Summary saved to $SUMMARY_FILE"
echo "DONE!"

