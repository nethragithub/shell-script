#!/bin/bash
source ./commom.sh
check-root
for i in $@
do
    echo "package to install:: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then 
       echo "$i is installed ...skipping"
    else
       dnf install $i -y &>>LOGFILE
    #   VALIDATE $1 "installation of $i"
    fi    