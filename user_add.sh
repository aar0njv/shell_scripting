# Assignment - 6 - Script - 1


#!/bin/bash

if [ "$EUID" -ne 0]; then
        echo "Error: This script must be run as root or with sudo." >&2
        exit 1
fi

read -p " Enter the name: " name
read -p " Enter the required password: " pass




