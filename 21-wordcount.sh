#!/bin/bash
if [ $# -eq 0 ]
then 
    echo "usage: $0 14-installation-validate-logs-colours.sh"
    exit 1
fi
FILE=$1

if [ ! -f $FILE ]
then
    echo "error: file $FILE not exist"
    exit 1
fi

echo "top 5 repeatative words in $FILE:" 
tr -c '[:alnum:]' '[\n*]' < $FILE | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -n 5                 