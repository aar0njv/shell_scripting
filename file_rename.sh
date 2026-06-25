#!/bin/bash

if [ $# -ne 1 ]; then
	echo " Invalid, Valid Format: $0 <directory_path>" >&2
	exit 1
fi

DIR_PATH="$1"

if [ ! -d "$DIR_PATH" ]; then
	echo " Error: Directory doesn't exist..." >&2
	exit 1
fi

echo "Renaming .txt files in $DIR_PATH..."
echo " "


for FILE in "$DIR_PATH"/*.txt
do 
	if [ ! -f "$FILE" ]; then 				# no file of the form */txt
		echo "No .txt files found in the directory."
		exit 0
	fi

	FILE_NAME=$(basename "$FILE")

	mv "$DIR_PATH/$FILE_NAME" "$DIR_PATH/backup_$FILE_NAME"

	echo "Renamed $FILE_NAME -> backup_$FILE_NAME"
done

echo "Execution Completed..."


