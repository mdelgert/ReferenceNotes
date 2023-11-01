#!/bin/bash

# https://www.linuxpedia.pl/articles/restic-basics/

# Install restic
#sudo apt install restic

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