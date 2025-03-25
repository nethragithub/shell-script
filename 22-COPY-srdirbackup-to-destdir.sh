#!/bin/bash
if [ $# -ne 2 ]
then 
    echo "usage: $0 source_dir dest_dir"
fi
source_dir=$(/tmp/log/data)
if [ ! -d $source_dir ]
then
    echo "error: $source_diror not exist"
else
    mkdir -p $source_di 
fi
dest_dir=$(/tmp/backup) 
if [ ! -d $dest_dir ]
then
    echo "error: $dest_dir not exists"
else
    mkdir -p $dest_dir
fi
TIMESTAMP=$(date +%F-%H-%M-%S)
ARCHIVE_NAME=$(basename $source_dir)_$TIMESTAMP.tar.gz
tar -czf $dest_dir/$ARCHIVE_NAME -C $(dirname $source_dir) $(basename $source_dir)           

           