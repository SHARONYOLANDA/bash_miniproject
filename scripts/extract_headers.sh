#!/usr/bin/bash
cd ../Data/

#Extract head
grep '>' IP-004_S38_L001_scaffolds.fasta | cut -d"_" -f1-2 | cut -f2 -d">" > ../results/sequence_ids.txt

#Count sequences
COUNT=$(grep -c '>' IP-004_S38_L001_scaffolds.fasta)

#Print message
echo "Extracted $COUNT sequence identifiers"
