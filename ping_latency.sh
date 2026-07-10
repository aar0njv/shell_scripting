# Assignment - 5 - Script - 2


#!/bin/bash

TARGETS=("127.0.0.1" "google.com" "github.com" "192.168.56.105")

for IP in ${TARGETS[@]}
do
	echo -n "Pinging $IP ..."

	if ping -c 3 -W 2 "$IP" > /tmp/ping_out.txt 2>&1; then
		AVG_TIME=$(tail -n 1 /tmp/ping_out.txt | cut -d '/' -f5)
		echo "[ONLINE] -> Avg Response Time: ${AVG_TIME}ms"
	else
		echo "[UNREACHABLE] -> Host did not respond."
	fi

done

rm -f /tmp/ping_out.txt



