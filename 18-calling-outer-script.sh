#!/bin/bash
source ./17-commom.sh
check_root
for i in $@
do
  dnf install -y $i &>>$LOGFILE
done