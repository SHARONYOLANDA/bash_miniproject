#!/usr/bin/bash

cd ../Data/

minimum_length=10000
minimum_coverage=5.0

# Overwrite previous results
> ../results/high_quality_scaffolds.txt

length_list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4) # Generating a list of the sequence lengths

for length in $length_list; do # Using a for loop to iterate over the length list
        if [ "$length" -ge "$minimum_length" ]; then # comparisons on integers
                cov=$(grep "length_$length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f6)
		if [ -n "$cov" ] && [ $(echo "$cov >= $minimum_coverage" | bc -l) -eq 1 ]; then # comparisons on float are different from integers
			grep "length_$length" IP-004_S38_L001_scaffolds.fasta >> ../results/high_quality_scaffolds.txt
		fi
		
        fi
done

sequence_count=$(cat ../results/high_quality_scaffolds.txt | wc -l)

echo "Found $sequence_count sequences high quality scaffolds"

