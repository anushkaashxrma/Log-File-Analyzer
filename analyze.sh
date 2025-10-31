#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./analyze.sh <log_file>"
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "File not found!"
    exit 1
fi

count_errors() {
    grep -i "error" "$LOGFILE" | wc -l
}

count_warnings() {
    grep -i "warning" "$LOGFILE" | wc -l
}

count_info() {
    grep -i "info" "$LOGFILE" | wc -l
}

show_report() {
    total_lines=$(wc -l < "$LOGFILE")
    errors=$(count_errors)
    warnings=$(count_warnings)
    info=$(count_info)

    echo "===== Log File Analysis Report ====="
    echo "Analyzed File: $LOGFILE"
    echo "------------------------------------"
    echo "Total Lines: $total_lines"
    echo "Errors: $errors"
    echo "Warnings: $warnings"
    echo "Info Messages: $info"
    echo "------------------------------------"
}

while true; do
    echo ""
    echo "===== LOG ANALYZER MENU ====="
    echo "1) Count Errors"
    echo "2) Count Warnings"
    echo "3) Count Info Messages"
    echo "4) Show Full Report"
    echo "5) Exit"
    echo "Choose an option: "
    read choice

    case $choice in
        1) echo "Errors: $(count_errors)" ;;
        2) echo "Warnings: $(count_warnings)" ;;
        3) echo "Info Messages: $(count_info)" ;;
        4) show_report ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option ‼️ Try again." ;;
    esac
done
