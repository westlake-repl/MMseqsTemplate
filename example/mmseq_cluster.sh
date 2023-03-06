# save DB files in DB dir
cd $DB_DIR
# create DB
$MMSEQS createdb $FASTA_PATH DB
# prepare temperary directory
mkdir $TMP_DIR
# cluster
$MMSEQS cluster DB DB_clu $TMP_DIR --min-seq-id 0.5
# save representative sequence
$MMSEQS createsubdb DB_clu DB DB_clu_rep
# convert result to fasta-like format
$MMSEQS convert2fasta DB_clu_rep $REP_FASTA_PATH