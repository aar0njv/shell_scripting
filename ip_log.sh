
# Assignment - 4 - Script - 2

#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <log_file>" >&2
	exit 1
fi 

LOG_FILE="$1"

read -p "Enter the threshold: " THRESHOLD

if [  ! -f "$LOG_FILE" ]; then
	echo "Error: File doesn't exist." >&2
	exit 1
fi


awk '{print $1}' "$LOG_FILE" |  sort | uniq -c | while read -r COUNT IP
do 
	if [ "$COUNT" -gt "$THRESHOLD" ]; then
		echo "IP: $IP -> Total Requests: $COUNT"
	fi
done
