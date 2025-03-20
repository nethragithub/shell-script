#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
echo "script running start at:: $TIMESTAMP"

set -e
handle_error(){
    echo "Error occured at line number: $1, error command: $2"
}
trap 'handle_error ${LINENO} "$BASH_COMMAND"' ERR

VALIDATE () {
    if [$1 -ne 0]
    then
       echo -e "$2 is $R failed $N"
       exit 1
    else
       echo -e "$2 is $G success $N"
    fi
}    

check_root(){
    if [ $USERID -ne 0 ]
    then 
       echo "please run script with root access"
    else
       echo "you are root user"
fi
}