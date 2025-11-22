#!/usr/bin/bash

longest=$(grep "^>" ../Data/IP-004_S38_L001_scaffolds.fasta \
| cut -d'>' -f2 | cut -d'_' -f4 | sort -nr | head -n1)

#Identifies which scaffold (NODE_X) has the longest sequence
node=$(grep "length_$longest" ../Data/IP-004_S38_L001_scaffolds.fasta \
| cut -d'>' -f2 | cut -d'_' -f1,2 | head -n1)

#Reports the sequence length (extracted from the header)
length=$(grep "length_$longest" ../Data/IP-004_S38_L001_scaffolds.fasta \
| cut -d'>' -f2 | cut -d'_' -f4 | head -n1)

#Coverage
cov=$(grep "length_$longest" ../Data/IP-004_S38_L001_scaffolds.fasta \
| cut -d'>' -f2 | cut -d'_' -f6 | head -n1)

#Write to file
echo "Longest sequence:$node" > ../results/longest_sequence.txt
echo "Length:$length bases" >> ../results/longest_sequence.txt
echo "Coverage:$cov" >> ../results/longest_sequence.txt
