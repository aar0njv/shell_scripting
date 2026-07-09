

# Assignment - 3 - Script - 2

#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Error: Missing input parameter..." >&2
	exit 1
fi


PROCESS_NAME="$1"

echo "Checking status of '$PROCESS_NAME'"
echo "-----------------------------------------"

if pgrep "$PROCESS_NAME" > /dev/null; then
	echo "Success: '$PROCESS_NAME' is actively running."

else
	echo "Warning: '$PROCESS_NAME' is not running!"
	echo "Starting the service now..."

	
	sudo systemctl start "$PROCESS_NAME"
	
	if pgrep "$PROCESS_NAME" > /dev/null; then
		echo "Successfully started '$PROCESS_NAME'"
	else
		echo "Failed to start '$PROCESS_NAME', check system status."
		exit 1
	fi

fi	

