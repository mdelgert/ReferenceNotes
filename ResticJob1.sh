#!/bin/bash

# Set the repository path
export RESTIC_REPOSITORY="/mnt/gfs/restic"
export RESTIC_PASSWORD="password"

# Exclude directory
EXCLUDE_DIR="/mnt/d1/docker"

# Set the directories to back up
BACKUP_DIR="/mnt/d1"

# Run the backup
restic backup $BACKUP_DIR --exclude $EXCLUDE_DIR

# Prune old snapshots
restic forget --keep-last 7 --keep-daily 1 --keep-weekly 4 --keep-monthly 12

# Exit successfully
exit 0

# Example crontab daily restic backup
# 0 1 * * * /home/mdelgert/scripts/restic_daily.sh
