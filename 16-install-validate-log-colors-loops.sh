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

VALIDATE () {
    if [$1 -ne 0]
    then
       echo -e "$2 is $R failed $N"
       exit 1
    else
       echo -e "$2 is $G success $N"
    fi
}    

if [ $USERID -ne 0 ]
then 
    echo "please run script with root access"
else
    echo "you are root user"
fi

for i in $@
do
    echo "package to install:: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then 
       echo "$i is installed ...skipping"
    else
       dnf install $i -y &>>LOGFILE
       VALIDATE $1 "installation of $i"
    fi    
done