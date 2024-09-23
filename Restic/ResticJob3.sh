#!/bin/bash

# Set the repository path
export RESTIC_REPOSITORY="/mnt/gfs/restic"
export RESTIC_PASSWORD="password"

# Exclude directory
EXCLUDE_DIR="/mnt/d1/docker"

# Set the directories to back up
BACKUP_DIR="/mnt/d1"

# Generate a Unix timestamp
timestamp=$(date +"%s")

# Define log file path
log_file="logs/restic_daily_$timestamp.log"

# Function to log messages with date and time
log() {
  local log_message="$1"
  local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$timestamp: $log_message" >> "$log_file"
}

# Redirect stdout and stderr to the log file
exec > >(tee -a "$log_file")
exec 2>&1

# Log the start of the script
log "Starting the backup script"

# Run the backup
log "Running the backup..."
restic backup $BACKUP_DIR --exclude $EXCLUDE_DIR

# Prune old snapshots
log "Pruning old snapshots..."
restic forget --keep-last 7 --keep-daily 1 --keep-weekly 4 --keep-monthly 12

# Log the completion of the script
log "Script completed successfully"

# Exit successfully
exit 0

# Example crontab daily restic backup
# 0 1 * * * /home/mdelgert/scripts/restic_daily.sh