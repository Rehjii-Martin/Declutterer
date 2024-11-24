#!/bin/bash

# Define the directory to clean
SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

# Check if the directory exists
if [ ! -d "$SCREENSHOTS_DIR" ]; then
    echo "Directory $SCREENSHOTS_DIR does not exist. Exiting."
    exit 1
fi

# Get today's date in YYYY-MM-DD format
TODAY=$(date +%Y-%m-%d)

# Find and delete all images older than today
find "$SCREENSHOTS_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) ! -newermt "$TODAY" -exec rm -v {} \;

echo "All screenshots older than today have been deleted from $SCREENSHOTS_DIR."
