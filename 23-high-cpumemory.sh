#!/bin/bash

# Set CPU usage threshold (in percentage)
THRESHOLD=80

# Get the top 5 CPU-consuming processes
echo "Top 5 CPU-consuming processes:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# Check for processes exceeding the threshold
echo ""
echo "Checking for processes exceeding ${THRESHOLD}% CPU usage..."

# Loop through each process and check CPU usage
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | awk 'NR>1 {if ($4 > '"$THRESHOLD"') print $0}' | while read -r pid ppid cmd cpu; do
    echo "ALERT: Process $pid ($cmd) is using $cpu% CPU!"

    # Example alert (send email or log it)
    # mail -s "High CPU Usage Alert" user@example.com <<< "Process $pid ($cmd) is using $cpu% CPU!"
done
