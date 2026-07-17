#!/bin/bash

echo "    SYSTEM USERS AND RECENT LOGIN TIMES   "


sudo grep -a "session opened for user" /var/log/auth.log | tail -n 10 | awk '{print "Date: " $1, $2 " | User: " $11}' | grep -v "User: ;"

# grep -a Searches auth.log for successful user sessions 
# tail -n Trims the list to evaluate just the 15 most recent rows
# awk Extracts and formats the Timestamp ($1) and Username ($11)
# grep -v Deletes lines ending in generic semicolons

