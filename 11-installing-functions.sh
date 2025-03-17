#!/bin/bash
USERID=$(id -u)
VALIDATE () {
    echo "exit status:: $1"
    echo "what are you doing:: $2"
}
if [$USERID -ne 0]
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
        #$1       #$2
        