#!/usr/bin/bash

#Counts the number of protein entries and saves the count to results/protein_count.txt
tail -n +74 ../Data/humchrx.txt | grep -v '^-' | wc -l > ../results/protein_count.txt
