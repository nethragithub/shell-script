#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
echo "script starting at:: ${TIMESTAMP}"

VALIDATE () {
    if [$1 -ne 0]
    then
        echo -e "installation of $2 is $R failed $N"
        exit 1
    else
        echo -e "installation of $2 is $G suceess $N"
    fi            
}
if [$USERID -ne 0]
then
    echo "run script with root access"
    exit 1
else
    echo "you are root user"
fi
dnf install mysql -y &>>$LOGFILE
VALIDATE $? "installing mysql"
dnf install nginx -y &>>$LOGFILE
VALIDATE $? "installing nginx"          