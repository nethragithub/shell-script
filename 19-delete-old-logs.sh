#!/bin/bash
source_directory=/tmp/app-logs
R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"
if [ -d $source_directory ]
then
    echo "source_directory exists"
else
    echo "please make sure $source_directory exists"
fi
FILES=(find $source_directory -name "*.logs" -mtimes +14)

while IFS=read -r lines
do 
    echo "deleting files:: $FILES"
    rm -rf $lines
done <<$FILES          