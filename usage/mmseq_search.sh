WORKING_PATH=$(pwd)

# save DB files in DB dir
DB_DIR=$WORKING_PATH/database
MMSEQS="fill this with your own mmseqs path"
FASTA_PATH="fill this with your own input path"
TMP_DIR=$WORKING_PATH/tmp
ALIGN_FASTA_PATH="fill this with your own output path"

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

# save DB files in DB dir
cd $DB_DIR
# create query DB
$MMSEQS createdb $FASTA_PATH queryDB
# create target DB
$MMSEQS createdb $ALIGN_FASTA_PATH targetDB
# prepare temperary directory
mkdir $TMP_DIR
# search
$MMSEQS search queryDB targetDB alignDB $TMP_DIR --min-seq-id 0.5 --alignment-mode 3 --max-seqs 300 -s 7 -c 0.8 --cov-mode 0
# convert result to fasta-like format
$MMSEQS convertalis queryDB targetDB alignDB $ALIGN_FASTA_PATH --format-output query