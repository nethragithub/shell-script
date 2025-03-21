#!/bin/bash
SOURCE_DIRECTORY=/tmp/app-logs
R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"
if [ -d $SOURCE_DIRECTORY ]
then
    echo "source_directory exists"
else
    echo "please make sure $source_directory exists"
fi
FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS= read -r line
do 
    echo "deleting files:: $FILES"
    rm -rf $line
done <<< $FILES          