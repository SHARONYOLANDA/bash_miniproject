#!/usr/bin/bash

#Min_length
min_length=5000
echo "Filtering sequences with length >= $min_length bases"

#Extract headers,filter by length≥5000, sort numerically
grep "^>" ../Data/IP-004_S38_L001_scaffolds.fasta | while read line;
do
        #Extract length from header
        length=$(echo "$line" | cut -d'_' -f4)

        #Filter sequences with length ≥5000
        if [ "$length" -ge "$min_length" ]; then
                echo "$line"
        fi
done | sort -t'_' -k4 -n >../results/filtered_sequences.txt

#Counting sequences
count=$(wc -l <../results/filtered_sequences.txt)

#Print summary
echo "Found $count sequences with length >= $min_length bases"
