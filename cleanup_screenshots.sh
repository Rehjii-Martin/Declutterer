#!/bin/bash

# Declutterer - Remove old screenshots based on user-defined age limit.

# Default settings
DIRECTORY="$HOME/Pictures/Screenshots"
DAYS_OLD=1 # Default age limit for deletion (in days)
DRY_RUN=false # Dry-run mode disabled by default

# Display usage
usage() {
    echo "Usage: $0 [-d directory] [-a age_limit] [-n]"
    echo "  -d directory    Directory to clean (default: $DIRECTORY)"
    echo "  -a age_limit    Age limit in days (default: $DAYS_OLD)"
    echo "  -n              Dry-run mode (list files to delete without deleting)"
    exit 1
}

# Parse command-line arguments
while getopts "d:a:n" opt; do
    case $opt in
        d) DIRECTORY=$OPTARG ;;
        a) DAYS_OLD=$OPTARG ;;
        n) DRY_RUN=true ;;
        *) usage ;;
    esac
done

# Verify the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

# Find and process files
echo "Scanning $DIRECTORY for files older than $DAYS_OLD days..."
FILES=$(find "$DIRECTORY" -type f -mtime +"$DAYS_OLD")

if [ -z "$FILES" ]; then
    echo "No files older than $DAYS_OLD days found in $DIRECTORY."
    exit 0
fi

if [ "$DRY_RUN" = true ]; then
    echo "Dry-run mode: The following files would be deleted:"
    echo "$FILES"
else
    echo "Deleting files older than $DAYS_OLD days..."
    find "$DIRECTORY" -type f -mtime +"$DAYS_OLD" -exec rm -v {} \;
    echo "Deletion complete."
fi

