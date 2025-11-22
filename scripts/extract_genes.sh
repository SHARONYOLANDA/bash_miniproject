#!/usr/bin/bash

#Extracting all unique gene names from the file and sorting them alphabetically
tail -n +74 ../Data/humchrx.txt | grep -v '^-' | cut -d' ' -f1 | sort | uniq > ../results/gene_names_sorted.txt

echo "Extracted $(wc -l < ../results/gene_names_sorted.txt) unique gene names"
