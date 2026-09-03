#!/bin/bash

# Ask user for a search term (e.g., a species or gene name)
echo "Enter a search term (e.g., 'Homo sapiens[ORGN] AND COX1[GENE]'):"
read search_term

# Ask user for the number of sequences to download
echo "How many sequences do you want to download?"
read count

# Search GenBank and save the results in a FASTA file
output_file="genbank_sequences.fasta"
esearch -db nucleotide -query "$search_term" | \
    efetch -format fasta -start 1 -stop "$count" > "$output_file"

# Confirm success
if [[ -s $output_file ]]; then
    echo "Downloaded $count sequences into $output_file."
else
    echo "No sequences found or an error occurred."
fi
