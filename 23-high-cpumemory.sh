#!/bin/bash
THRESHOLD=85
echo "top 5 cpu consuming process:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
echo " "
echo "checking for the process that exceeds $THRESHOLD% cpu usage"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | awk 'NR>1 {if ($4 > '"$THRESHOLD"') print $0}'
while read - r pid,ppid,cmd,cpu
do
  echo "Alert:: process $pid $cmd is using $cpu% cpu!"
  snail -s "cpu high usage alert" nethra.sangeetham@gmail.com << "process $pip $cmd is using $cpu% cpu!"
done  