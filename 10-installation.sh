#!/bin/bash
USERID=$(id -u)
if [$USERID -ne 0]
then
    echo "run script with root access"
    exit 1
else 
    echo "you are root user"
fi    
dnf install mysql -y
if [$? -ne 0]
then
    echo "sql installation failed"
    exit 1
else 
    echo "sql installation success"
fi
dnf install git -y
if [$? -ne 0]
then
    echo "git installation failed"
    exit 1
else 
    echo "git installation success
fi        