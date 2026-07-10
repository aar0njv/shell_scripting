# Assignment - 5 - Script - 3

#!/bin/bash

read -p "Enter the website url: " URL

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS_CODE" -eq 000 ]; then
	echo " [ DOWN ]  ->  CRITICAL: Cannot connect to the server or domain doesn't exit" >&2
	exit 1

elif [ "$STATUS_CODE" -ge 200 ] && [ "$STATUS_CODE" -lt 400 ]; then
	echo " [ UP ] -> Success! Server responded with Status: $STATUS_CODE"

else 
	echo " [ WARNING ] -> Server is reachable but responded with an Error Status: "$STATUS_CODE"">&2

fi

