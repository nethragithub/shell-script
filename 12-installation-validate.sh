#!/bin/bash
USERID=$(id -u)

VALIDATE () {
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed"
        exit 1
    else
        echo "$2 is suceess"
    fi            
}
if [ $USERID -ne 0 ]
then
    echo "run script with root access"
    exit 1
else
    echo "you are root user"
fi

dnf install mysql -y
VALIDATE $? "installing mysql"

dnf install nginx -y
VALIDATE $? "installing nginx"          