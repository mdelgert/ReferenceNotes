#!/bin/bash

# https://restic.readthedocs.io/en/stable/030_preparing_a_new_repo.html
# Set the repository
# restic init --repo /mnt/restic

# Set the repository path
export RESTIC_REPOSITORY="/mnt/gfs/restic"
export RESTIC_PASSWORD="password"

# Set the directories to back up
BACKUP_DIRS="/mnt/gfs/test"

# Create a lock file to prevent multiple backups from running at the same time
LOCK_FILE="/var/run/restic-backup.lock"
if [ -f "$LOCK_FILE" ]; then
  echo "Another backup is already running. Exiting."
  exit 1
fi

touch "$LOCK_FILE"

# Run the backup
restic backup $BACKUP_DIRS

# Prune old snapshots
restic forget --keep-last 7 --keep-daily 1 --keep-weekly 4 --keep-monthly 12

# Remove the lock file
rm "$LOCK_FILE"

# Exit successfully
exit 0