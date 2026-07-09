
# Assignment - 4 - Script - 1

#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Invalid usage...   [ $0 <csv-file> <column-number> ] " >&2
    exit 1
fi

CSV_FILE="$1"
COL_NUM="$2"

if [ ! -f "$CSV_FILE" ]; then
    echo "Error: '$CSV_FILE' doesn't exist." >&2
    exit 1
fi

TOTAL_SUM=0

# this command specifically tells to start from line 2 onwards

while read -r LINE
do
    # cut to extract only the required col value
    VALUE=$(echo "$LINE" | cut -d',' -f"$COL_NUM")

    # adds that value to the total sum value
    TOTAL_SUM=$((TOTAL_SUM + VALUE))
    
# this command specifically tells to start from line 2 onwards
done < <(tail -n +2 "$CSV_FILE")    # passes the tail output to the while loop, removing the header
echo "Total Sum of column $COL_NUM is: $TOTAL_SUM"