# Assignment - 6 - Script - 2

#!/bin/bash

read -s -p "Enter the password to evaluate: " PASSWORD

echo ""

if [ ${#PASSWORD} -lt 8]; then
    echo "Weak Password: Must be atleast 8 characters long."
    exit 0
fi

if [[ ! "$PASSWORD" =~ [0-9] ]]; then
    echo "Weak Password: Must include atleast one digit (0-9)."
    exit 0
fi

if [[ ! "$PASSWORD" =~ [A-Z] ]]; then
    echo "Weak Password: Must include atleast one uppercase letter (A-Z)"
    exit 0
fi

if [[ ! "$PASSWORD" =~ [#@\$%^\&*()_+=\-\[\]{}~\|] ]]; then
    echo "Weak Password: Must include atleast one special character (@, #, $, %, etc.)."
    exit 0
fi

echo "Strong Password: Meets all security policies."
