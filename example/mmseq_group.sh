# save DB files in DB dir
cd $DB_DIR
# create DB
$MMSEQS createdb $FASTA_PATH DB
# prepare temperary directory
mkdir $TMP_DIR
# cluster
$MMSEQS cluster DB DB_clu $TMP_DIR --min-seq-id 0.5
# save representative sequence
$MMSEQS createseqfiledb DB DB_clu DB_clu_seq
# convert result to fasta-like format
$MMSEQS result2flat DB DB DB_clu_seq $GROUP_FASTA_PATH