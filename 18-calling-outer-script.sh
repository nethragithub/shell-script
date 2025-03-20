#!/bin/bash
source ./17-commom.sh
check_root
for i in $@
do
  dnf install sql -y &>>$LOGFILE
done