# Question no : 3
#--------------------------------


#!/bin/bash

# Check if a log file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/webserver.log"
    exit 1
fi

LOG_FILE=$1

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found!"
    exit 1
fi

echo "Analyzing log file: $LOG_FILE"

# Number of 404 errors
echo "Number of 404 errors:"
grep "404" "$LOG_FILE" | wc -l

echo "-----------------------------"

# Most requested pages
echo "Most requested pages:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

echo "-----------------------------"

# IP addresses with the most requests
echo "IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

