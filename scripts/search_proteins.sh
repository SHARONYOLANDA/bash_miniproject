#!/usr/bin/bash

#To see if search term was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <search_term>"
    exit 1
fi

search_term="$1" #storing search term for first argument

# Search for the kinase in the protein descriptions, skipping headers and lines starting with '-'
tail -n +74 ../Data/humchrx.txt | grep -v '^-' | grep -i "$search_term" > ../results/protein_search_results.txt

# Count matches
count=$(wc -l < ../results/protein_search_results.txt) #counts how many matches have search term 

#Appending count to results file
echo "">> ../results/protein_search_results.txt
echo "Total matches: $count" >> ../results/protein_search_results.txt

#Display results
echo "Found $count matching proteins for '$search_term':" 
cat ../results/protein_search_results.txt #To show the results as in file proteins_search_results.txt
