#!/bin/bash

# Generate a Unix timestamp
timestamp=$(date +"%s")

# Enable or disable redirection to log file
redirect_output=true

if [ "$redirect_output" = true ]; then
  # Define log file path
  log_file="logs/restic_daily_$timestamp.log"

  # Redirect stdout and stderr to the log file
  exec > >(tee -a "$log_file")
  exec 2>&1
fi

# Log the start of the script
echo "$timestamp: Starting the backup script"

# Set the repository path
export RESTIC_REPOSITORY="/mnt/gfs/restic"
export RESTIC_PASSWORD="password"

# Exclude directory
EXCLUDE_DIR="/mnt/d1/docker"

# Set the directories to back up
BACKUP_DIR="/mnt/d1/portainer"

# Run the backup
echo "$timestamp: Running the backup..."
restic backup $BACKUP_DIR --exclude $EXCLUDE_DIR

# Prune old snapshots
echo "$timestamp: Pruning old snapshots..."
restic forget --keep-last 7 --keep-daily 1 --keep-weekly 4 --keep-monthly 12

# Log the completion of the script
echo "$timestamp: Script completed successfully"

# Exit successfully
exit 0

# Example crontab daily restic backup
# 0 1 * * * /home/mdelgert/scripts/restic_daily.sh