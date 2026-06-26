#!/bin/bash

PARTITION="/"
THRESHOLD=80
ALERT_EMAIL="aar0njv.devops@gmail.com"

# df -h (human readalbe disk metrics)
# tail -n 1 (one line from the bottom, used to remove to title
# tr -s ' ' removes extra spaces
# cut -d' ' -f5 cuts the content at delimiter(' ') and then selects the 5th element
# tr -d '%' removes the percentage symbol, finally we get the usage 


CURRENT_USAGE=$(df -h "$PARTITION" | tail -n 1 | tr -s ' ' | cut -d' ' -f5 | tr -d '%')

echo "Current Storage Utilization for '$PARTITION': $CURRENT_USAGE%"
echo "Configured Warning Threshold: $THRESHOLD%"
echo " ---------------------------------------------------------------"

if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
	echo "Over utilisation detected..." >&2
	
	SUBJECT="Alert: High Disk Usage"
	BODY="Warning: file system path '$PARTITION' has filled up past the safe threshold. \n
	Current Usage: $CURRENT_USAGE \n
	Configured Threshold: $THRESHOLD%"

	# -e used to interpret the escape sequences like \t and \n
	echo -e $BODY | mail -s "$SUBJECT" "ALERT_EMAIL"

else
	echo "Status: Storage bounds are safe, no action required."
fi
