# Bash Mini-Project: Genomic Data Analysis

## Student Information
**Name**: SHARON YOLANDA PAMBA
**Student ID**: MB300-OOO1/2024
**Course**: PUB 3127 - Computing for Biologists
**Date Started**: 20/11/2025
**Date Completed**: 25/11/2025

---

## Project Description
This project analyzes genomic scaffold data and protein database records using bash command-line tools. The analysis includes:
- Counting and filtering DNA sequences from FASTA files
- Identifying high-quality scaffolds based on length and coverage criteria
- Extracting and analyzing protein information from database files
- Automating bioinformatics workflows with bash scripts

---

## Repository Contents

```
bash_miniproject/
├── ASSIGNMENT.md     # Assignment instructions
├── Data         # Input data files
│   ├── IP-004_S38_L001_scaffolds.fasta
│   └── humchrx.txt
├── README.md
├── results      # Output files from analyses
│   ├── analysis_summary.txt
│   ├── filtered_sequences.txt
│   ├── gene_names_sorted.txt
│   ├── high_quality_scaffolds.txt
│   ├── longest_sequence.txt
│   ├── protein_count.txt
│   ├── protein_search_results.txt
│   ├── sequence_count.txt
│   └── sequence_ids.txt
└── scripts      # Bash scripts for analysis
    ├── extract_genes.sh
    ├── extract_headers.sh
    ├── filter_by_length.sh
    ├── high_quality_scaffolds.sh
    ├── longest_sequence.sh
    ├── protein_count.sh
    ├── run_analysis.sh
    └── search_proteins.sh

4 directories, 21 files

---

## Requirements

### Software
- Bash shell (Linux, macOS, or WSL on Windows)
- Git and GitHub account
- Basic Unix tools: `grep`, `cut`, `sort`, `uniq`, `wc`, `head`, `tail`
- Text editor (nano, vim, VS Code, etc.)

### Data Files
The `Data/` directory contains:
1. **IP-004_S38_L001_scaffolds.fasta** (~10 MB) - Genomic scaffolds from sequencing assembly
2. **humchrx.txt** (~152 KB) - UniProt protein entries for human chromosome X

---

## Usage Instructions

### Setup
1. Clone this repository:
   ```bash
   git clone [https://github.com/SHARONYOLANDA/bash_miniproject/blob/main/ASSIGNMENT.md]
   cd bash_miniproject
   ```

2. Verify data files are present:
   ```bash
   ls -lh Data/
   ```

### Running the Scripts

#### Script 1: Extract Headers
```bash
./scripts/extract_headers.sh
```
**Purpose**: Extracts all sequence headers from the FASTA file
**Output**: `results/sequence_ids.txt` - List of NODE identifiers

#### Script 2: Find Longest Sequence
```bash
./scripts/longest_sequence.sh
```
**Purpose**: Identifies the scaffold with the longest sequence
**Output**: `results/longest_sequence.txt` - Details of the longest scaffold

#### Script 3: Filter by Length
```bash
./scripts/filter_by_length.sh 5000
```
**Purpose**: Filters scaffolds with length >= specified minimum
**Output**: `results/filtered_sequences.txt` - Filtered scaffold headers

#### Script 4: High-Quality Scaffolds
```bash
./scripts/high_quality_scaffolds.sh
```
**Purpose**: Identifies scaffolds meeting both length and coverage criteria
**Output**: `results/high_quality_scaffolds.txt` - High-quality scaffold list

#### Script 5: Extract Gene Names
```bash
./scripts/extract_genes.sh
```
**Purpose**: Extracts unique gene names from protein database
**Output**: `results/gene_names_sorted.txt` - Sorted unique gene names

#### Script 6: Search Proteins
```bash
./scripts/search_proteins.sh "kinase"
```
**Purpose**: Searches for proteins matching a keyword
**Output**: `results/protein_search_results.txt` - Matching protein entries


### Running the Master Script
```bash
./scripts/run_analysis.sh ./Data/
```
**Purpose**: Runs all analyses in sequence and generates a comprehensive summary
**Output**:
- All result files from individual scripts
- `results/analysis_summary.txt` - Summary of all analyses with counts and timestamp


---

## Analysis Results Summary
Total sequences in FASTA: 35079
High-quality scaffolds: 33
Total protein entries: 856
Out of 35079 sequences, 267 had lengths ≥ 5000 bp.
33 were high-quality scaffolds

### FASTA File Analysis
- **Total number of sequences**: 35079
- **Longest sequence**: Longest sequence:NODE_1, Length:21257 bases, Coverage:6.323607
- **Number of sequences with length >= 5000**: 267
- **Number of high-quality scaffolds** (length >= 10000, coverage >= 5.0): 33

### Protein Database Analysis
- **Total protein entries**: 856
- **Number of unique genes**: 854
- **Example protein search result** (e.g., for "kinase"): 34

### Key Findings
One of my observations was that the data set provided out of 35079 sequences only 33 were long enough to be considered high quality scaffolds. 
The data set also had only 267 sequences with lengths longer than 5000. 
Only 34 sequences had kinase protein during the protein search.

---

## Scripts Description

| Script Name | Purpose | Key Commands Used |
|-------------|---------|-------------------|
| `extract_headers.sh` | Extract NODE identifiers from FASTA file | grep, cut, echo|
| `longest_sequence.sh` | Find the scaffold with the longest sequence | grep, cut, sort, head, echo |
| `filter_by_length.sh` | Filter scaffolds by minimum length | grep, cut, echo, wc, while and if loops |
| `high_quality_scaffolds.sh` | Identify high-quality scaffolds | grep, cut, wc if loop conditionals |
| `extract_genes.sh` | Extract unique gene names from protein file | grep, cut, sort, uniq, wc, echo |
| `search_proteins.sh` | Search for proteins by keyword | grep, if loop, tail, wc, cat, echo |
| `run_analysis.sh` | Master script that runs all analyses | if loop, echo |
| `protein_count.sh` | # Counts protein entries | grep, tail, echo, if loop |
---

## Challenges and Solutions

**Challenge 1**: I had trouble running the final analysis because some scripts in the scripts/ directory had incorrect paths, and i was using '>' therefore could not update the final results in the results files in the results directory after the first run of each script.
**Solution**: I fixed this by correcting all script paths and appending outputs to the results file using '>>', which allowed the full analysis to complete successfully and update itself in my results directory file on the analsis. This was only possible after seeking some help from the internet after running it for at least two days without any luck.

**Challenge 2**: I also lost some data while trying to redirect outputs into my results directory files. This was due to the paths i was using when writing my commands.
**Solution**: I ensured that i wrote the correct paths while writing my scripts in the initial scripts.

**Challenge 3**: Handling errors using 'if' statements and the '-f' flag when running the final analysis. running the final analysis was not that easy and i had to seek help from the internet a lot in order to understand which commands to use and what i was doing wrong. 
**Solution**: i used the internet commands in order to run the final analysis.
I also don't know how to stage.
---

## What I Learned

[TODO: Write a brief reflection (3-5 sentences) about what you learned from this project. Consider:]
- New bash commands or concepts you learned : '-f flag' and using '&&' together
- How command-line tools can be useful for bioinformatics : The command line can help me run analysis on biological sequences from Biological databases
- Any insights about version control with Git : I have no insights.
- How this project relates to your research interests : This will help me understand how to deal with large data sets during my research.

---

## References

- [Introduction to Linux Lectures](https://github.com/amelgh/Introduction_To_Linux/tree/master/Lectures)
- Course materials: PUB 3127 - Computing for Biologists
- Bash manual: `man bash`
- FASTA format: [https://en.wikipedia.org/wiki/FASTA_format](https://en.wikipedia.org/wiki/FASTA_format)

---

## License
This project is for educational purposes as part of PUB 3127 coursework.

---

## Acknowledgments
- **Instructor**: Dr. Caleb Kibet
- **Institution**: Pan African University Institute of Science, Technology and Innovation (PAUSTI)
- Data sources: Sequencing data and UniProt database

