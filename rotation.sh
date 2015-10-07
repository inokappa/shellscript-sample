#!/bin/sh

DATA_DIR="/path/to/data"
DATA_PREVIOUS_DIR="$DATA_DIR/previous"
#
function log_rotation() {
  i=5
  TARGET_FILE=$1
  while [ $i -gt 1 ]
  do
    if [ -e $DATA_PREVIOUS_DIR/$TARGET_FILE.`expr $i - 1` ]; then
      mv $DATA_PREVIOUS_DIR/$TARGET_FILE.`expr $i - 1` $DATA_PREVIOUS_DIR/$TARGET_FILE.$i 2>&1 1>/dev/null
    fi
    i=`expr $i - 1`
  done
  #
  if [ -e $DATA_DIR/$TARGET_FILE ]; then
    mv $DATA_DIR/$TARGET_FILE $DATA_PREVIOUS_DIR/$TARGET_FILE.1 2>&1 1>/dev/null
  fi
}

cd $DATA_DIR
for i in `ls *.{txt,tsv}`
do
  echo $i
  log_rotation $i
done
