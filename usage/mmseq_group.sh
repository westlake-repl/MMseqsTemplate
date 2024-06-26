WORKING_PATH=$(pwd)

# save DB files in DB dir
DB_DIR=$WORKING_PATH/database
MMSEQS="fill this with your own mmseqs path"
FASTA_PATH="fill this with your own input path"
TMP_DIR=$WORKING_PATH/tmp
GROUP_FASTA_PATH="fill this with your own output path"

if [ -d $DB_DIR ]; then
    echo "DB_DIR exists, remove it"
    echo "Be careful, this will remove all files in $DB_DIR"
    read -p "Press any key to continue, or press Ctrl+C to exit"
    rm -rf $DB_DIR
fi

if [ -d $TMP_DIR ]; then
    echo "TMP_DIR exists, remove it"
    echo "Be careful, this will remove all files in $TMP_DIR"
    read -p "Press any key to continue, or press Ctrl+C to exit"
    rm -rf $TMP_DIR
fi

mkdir -p $DB_DIR
mkdir -p $TMP_DIR

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