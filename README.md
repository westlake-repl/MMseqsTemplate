# MMseqsTemplate
A Easy-to use Template for mmseqs search and cluster. Reduce identity between protein sequences.
## Installation
Just install mmseqs in [the official website](https://github.com/soedinglab/MMseqs2#installation).
Remember the path of your mmseqs binary, this will be used in our script later.

## Usage
Check the scripts in `usage` folder and replace the template with your own paths:
1. mmseqs binary path (eg. `/usr/local/mmseqs/bin/mmseqs`)
2. input fasta path (eg. `/root/project/MMseqsTemplate/data/protein.fasta`)
3. output fasta path (eg. `/root/project/MMseqsTemplate/data/protein_rep50.fasta`)
Then run the scripts directly.

### Case 1: save the cluster center only
run `usage/mmseq_cluster.sh`
+ input: fasta file
+ output: fasta file (smaller)
### Case 2: save the cluster result and the groups
run `usage/mmseq_group.sh`
+ input: fasta file
+ output: fasta-like file (larger)
  eg. A fasta-like file may be like this:
  ```
  >sequence96
  >sequence96
  AVPVAVWLVSALAMGAGVAGG
  >sequence192
  AVPVAVWLVSALAMGAGMAGG
  >sequence165
  >sequence1
  >sequence1
  FLGFLLGVGSAIASGVAVSKV
  >sequence0
  FLGFLLGVGSAIASGTAVSKV
  >sequence72
  FLGFLLGIGSAIASGVAVSKV
  ```
### Case 3: filter similar sequence
run `usage/mmseq_search.sh`
+ input: 2 fasta files
+ output: list of the filtered sequence names
