# question 1
--------------------------------------------------------------


#!/bin/bash

# Configuration
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
LOG_FILE="/root/system_health.log"

# Function to log messages
log_message() {
    echo "$1"
    echo "$(date +"%Y-%m-%d %H:%M:%S"): $1" >> "$LOG_FILE"
}

# Check CPU usage
check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    CPU_USAGE=${CPU_USAGE%.*}
    if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
        log_message "High CPU usage: $CPU_USAGE%"
    else
        log_message "CPU usage is normal: $CPU_USAGE%"
    fi
}

# Check memory usage
check_memory() {
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    MEMORY_USAGE=${MEMORY_USAGE%.*}
    if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
        log_message "High memory usage: $MEMORY_USAGE%"
    else
        log_message "Memory usage is normal: $MEMORY_USAGE%"
    fi
}

# Check disk space usage
check_disk() {
    DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
    if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
        log_message "High disk space usage: $DISK_USAGE%"
    else
        log_message "Disk space usage is normal: $DISK_USAGE%"
    fi
}

# Check running processes
check_processes() {
    PROCESS_COUNT=$(ps aux | wc -l)
    log_message "Number of running processes: $PROCESS_COUNT"
}

# Run checks
log_message "Starting system health check..."
check_cpu
check_memory
check_disk
check_processes
log_message "System health check completed."

# Display the last 10 log entries
tail -n 10 "$LOG_FILE"

