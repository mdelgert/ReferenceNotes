#!/bin/bash

# Set the repository path
export RESTIC_REPOSITORY="/mnt/gfs/restic"
export RESTIC_PASSWORD="password"

# Set the directories to back up
BACKUP_DIRS="/mnt/d1"

# Run the backup
restic backup $BACKUP_DIRS

# Prune old snapshots
restic forget --keep-last 7 --keep-daily 1 --keep-weekly 4 --keep-monthly 12

# Exit successfully
exit 0

# Example crontab daily restic backup
# 0 1 * * * /home/mdelgert/scripts/restic_daily.sh
