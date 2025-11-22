#!/usr/bin/bash

#Identifies scaffolds meeting both criteria:
min_length=10000
min_coverage=5.0

echo "Filtering high-quality scaffolds: length >= $min_length, coverage >= $min_coverage"

#Counts how many scaffolds are high quality
count=0

#Reading headers
while read header
do
        #Extracting length and coverage
        length=$(echo "$header" | cut -d'_' -f4)
        coverage=$(echo "$header" | cut -d'_' -f6)

	# Compare coverage using bc (returns 1 if true)
	coverage_check=$(echo "$coverage >= $min_coverage" | bc)

    # To meet both length and coverage criteria
        if [ "$length" -ge "$min_length" ] && [ "$coverage_check" -eq 1 ]; then
        	echo "$header" >> ../results/high_quality_scaffolds.txt
        	count=$((count +1))
	fi
done < <(grep "^>" ../Data/IP-004_S38_L001_scaffolds.fasta)

echo "Total high-quality scaffolds: $count"
