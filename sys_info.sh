#!/bin/bash

echo "===== System Metrics ====="

echo "--- OS & Kernel Summary ---"

hostnamectl | grep -E "Operating System|Kernel"

echo "---------------------------"
echo "--- CPU Architecture ---"
lscpu | grep -E "Model name|CPU"
echo "---------------------------"


echo "--- Memory Info ---"

free -h

echo "==========================="
