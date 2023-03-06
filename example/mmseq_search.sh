# save DB files in DB dir
cd $DB_DIR
# create query DB
$MMSEQS createdb $QUERY_FASTA_PATH queryDB
# create target DB
$MMSEQS createdb $TARGET_FASTA_PATH targetDB
# prepare temperary directory
mkdir $TMP_DIR
# search
$MMSEQS search queryDB targetDB alignDB $TMP_DIR --min-seq-id 0.5 --alignment-mode 3 --max-seqs 300 -s 7 -c 0.8 --cov-mode 0
# convert result to fasta-like format
$MMSEQS convertalis queryDB targetDB alignDB $ALIGN_FASTA_PATH --format-output query