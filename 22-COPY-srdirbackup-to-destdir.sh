#!/bin/bash
if [ $# -ne 2 ]
then 
    echo "usage: $0 /tmp/doc/mydata /tmp/backup
fi
source_dir=$1
if [ ! -d $source_dir ]
then
    echo "error: $source_dir not exist"
    exit 1
fi
dest_dir=$2
if [ ! -d $dest_dir ]
then
    mkdir -p $dest_dir
fi
TIMESTAMP=$(date +%F-%H-%M-%S)
ARCHIVE_NAME=$(basename $source_dir)_$TIMESTAMP.tar.gz
tar -czf $dest_dir/$ARCHIVE_NAME -C $(dirname $source_dir) $(basename $source_dir)           

           