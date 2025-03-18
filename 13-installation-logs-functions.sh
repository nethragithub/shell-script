#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
USERID=$(id -u)

VALIDATE () {
   if [ $1 -ne 0 ]
   then
       echo "installation of $2 is failed"
       exit 1
    else
       echo "installation of $2 is suceess"
    fi            
}
if [ $USERID -ne 0 ]
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