#!/bin/bash

# Your Name
NAME="Habib"

# Timestamp for log file
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Log file name
LOG_FILE="system_info_${TIMESTAMP}.log"

# Retrieve system information
SYSTEM_NAME=$(hostname)
CPU_MODEL=$(grep -m 1 "model name" /proc/cpuinfo | cut -d ":" -f 2 | sed 's/^ //g')
CPU_COUNT=$(grep -c "processor" /proc/cpuinfo)
MEMORY_TOTAL=$(grep "MemTotal" /proc/meminfo | awk '{print $2 / 1024 " MB"}')
OS_INFO=$(lsb_release -d | cut -f2)
STORAGE_TOTAL=$(df -h --total | grep "total" | awk '{print $2}')

# Format and display the output
OUTPUT=$(cat <<EOF
---------------------------------------------
SYSTEM INFORMATION REPORT
---------------------------------------------
Your Name:          $NAME
System Name:        $SYSTEM_NAME
CPU Model:          $CPU_MODEL
Total CPUs:         $CPU_COUNT
Total Memory (RAM): $MEMORY_TOTAL
OS Information:     $OS_INFO
Total Storage:      $STORAGE_TOTAL
---------------------------------------------
EOF
)

# Print to terminal
echo "$OUTPUT"

# Save to log file
echo "$OUTPUT" > $LOG_FILE
echo "System information has been saved to $LOG_FILE"

