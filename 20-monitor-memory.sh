#!/bin/bash
DISK_USAGE=$(df -hT | grep -i xfs)
DISK_THRESHOLD=1
MESSAGE=" "

while IFS=read -r line
do
  USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
  FOLDER=$(echo $line | awk -F " " '{print $NF}')
  if [ $USAGE -ge $DISK_THRESHOLD ]
  then
      MESSAGE+="$FOLDER is greather than $DISK_THRESHold, current_usage=$USAGED \n"
  fi 
done >> $DISK_USAGE   
echo -e "message:$MESSAGE"
echo "$MESSAGE" | snail -s "Disk usage alert" nethra.sangeetham@gmail.com"