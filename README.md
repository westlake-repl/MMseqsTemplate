# MMseqsTemplate
Template for mmseqs search and cluster. Reduce identity between protein sequences.
## Usage
### Case 1: save the cluster center only
see `example/mmseq_cluster.sh`
+ input: fasta file
+ output: fasta file (smaller)
### Case 2: save the cluster result and the groups
see `example/mmseq_group.sh`
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
see `example/mmseq_search.sh`
+ input: 2 fasta files
+ output: list of the filtered sequence names
