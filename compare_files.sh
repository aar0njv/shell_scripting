#!/bin/bash


if [ $# -ne 2 ]; then
	echo "Invalid input count, needs two arguements" >&2
	exit 1
fi

FILE1="$1"
FILE2="$2"

if [ ! -f "$FILE1" ] || [ ! -f "$FILE2" ]; then
	echo " Error: File doesnt exist." >&2
	exit 1
fi

echo "Comparing "$FILE1" and "$FILE2"...."

DIFFERENCES=$(diff "$FILE1" "$FILE2")

DIFF_RESULT=$?

if [ $DIFF_RESULT -eq 0 ]; then
	echo "The files are completely identical..."
else
	echo "------------------------------"
	echo "The files are different..."
	echo "$DIFFERENCES"
fi

