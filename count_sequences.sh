#!/bin/bash

# Check if the input file is provided
if [[ $# -eq 0 ]]; then
    echo "Usage: ./count_sequences.sh <fasta_file>"
    exit 1
fi

fasta_file=$1
output_file="sequence_count.txt"

# Count sequences (lines starting with '>')
sequence_count=$(grep -c '^>' "$fasta_file")

# Save results
echo "The file $fasta_file contains $sequence_count sequences." > "$output_file"
echo "Results saved to $output_file."
