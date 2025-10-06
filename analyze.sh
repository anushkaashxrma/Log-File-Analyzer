#!/bin/bash
# analyze.sh — Analyze system log files

# Check if a log file name is given
if [ $# -eq 0 ]; then
  echo "Usage: ./analyze.sh <log_file>"
  exit 1
fi

logfile=$1

# Check if file exists
if [ ! -f "$logfile" ]; then
  echo "Error: File '$logfile' not found!"
  exit 1
fi

# Count occurrences (case-insensitive)
errors=$(grep -i "error" "$logfile" | wc -l)
warnings=$(grep -i "warning" "$logfile" | wc -l)
info=$(grep -i "info" "$logfile" | wc -l)

# Output results
echo "Errors: $errors"
echo "Warnings: $warnings"
echo "Info Messages: $info"
