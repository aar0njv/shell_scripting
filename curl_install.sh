#!/bin/bash

# grep -w used to get line with the word ID from /etc/os-release (ID="ubuntu")
# cut -d= used to split the line with = as the delimiter ("ID", "ubuntu"), -f2 selects the second field ("ubuntu")
#tr -d '"' used to trim the double quotes (") from each side

OS_TYPE=$(grep -w "ID" /etc/os-release | cut -d= -f2 | tr -d '"')

echo "Detected OS: $OS_TYPE"

case $OS_TYPE in
    "debian" | "ubuntu")
        echo "Installing curl using apt..."
	sudo apt update && sudo apt install -y curl        
        ;;
    "rhel" | "almalinux" | "centos")
        echo "Installing curl using ..."
	sudo dnf install -y curl
        ;;
    "alpine")
	echo "Installing curl using ..."
	sudo apk add curl
        ;;
    *) 		# error message (unknown os distribution handling)
        echo "Distribution not identified" >&2
        exit 1   # non-zero exit code for failure state
        ;;
esac








