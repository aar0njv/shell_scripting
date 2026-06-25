
#!/bin/bash

# ensure only one arguement is passed, 
# $# returns number of args, (-ne means not equal)

if [ $# -ne 1 ]; then
	echo " Invalid input..."
	echo " Valid Usage: $0 <directory_path>" >&2
	exit 1
fi

DIR_PATH="$1"


# (! -d <dir-path>) checks if the directory actually exists.

if [ ! -d "$DIR_PATH" ]; then
	echo " Error: Directory '$DIR_PATH' does not exist." >&2
	exit 1
fi

echo " Listing files in the directory: $DIR_PATH "
echo "------------------------------------------------"


ls $DIR_PATH




