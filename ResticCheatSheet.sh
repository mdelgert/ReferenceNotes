#!/bin/bash

# https://www.linuxpedia.pl/articles/restic-basics/
# https://restic.readthedocs.io/en/latest/020_installation.html

# Windows Install restic
#scoop install restic
#choco install restic

# Set windows restic enviornment variables
#setx RESTIC_REPOSITORY "S:\restic"
#setx RESTIC_PASSWORD "password"


# Linux Install restic
#sudo apt install restic

# Once downloaded, the official binaries can be updated in place using the restic self-update command (needs restic 0.9.3 or later):
#sudo restic self-update

# Set location and password
export RESTIC_REPOSITORY="/mnt/gfs/restic"
export RESTIC_PASSWORD="password"

# Make repo
#restic init

# Backup data
#restic backup /mnt/gfs/test --verbose

# Listing snapshots from repository
restic snapshots

# Listing contents of latest snapshot
#restic ls latest

# Listing contents of a specific snapshot
#restic ls SNAPSHOT_ID_IN_HEX

# Restoring data latest snapshot
#restic restore latest --target /mnt/gfs/restore/test1

# Restoring specific snapshot
#restic restore SNAPSHOT_ID_IN_HEX --target /mnt/gfs/restore/test2

# Restore specific file
#restic restore SNAPSHOT_ID_IN_HEX --include /mnt/gfs/test/test3.txt --target /mnt/gfs/restore/test2
#restic restore SNAPSHOT_ID_IN_HEX --include /mnt/gfs/test/test3.txt --target /

# Delete snapshot
#restic forget SNAPSHOT_ID_IN_HEX

# Remove lock
# https://github.com/restic/restic/issues/1450
# If does not unlock verify latest version
#restic unlock
#restic rebuild-index
#restic prune
#restic check