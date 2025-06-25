#!/bin/bash

export RESTIC_REPOSITORY="/mnt/backup/restic"
export RESTIC_PASSWORD="do"

BACKUP_PATHS="/home /etc /var/log"
EXCLUDE_FILE="/etc/restic/excludes.txt"
LOGFILE="/var/log/restic-backup.log"

# Backup ausführen
restic backup $BACKUP_PATHS --exclude-file=$EXCLUDE_FILE >> $LOGFILE 2>&1

# Alte Snapshots nach Plan löschen
restic forget --keep-daily 7 --keep-weekly 4 --keep-monthly 6 --prune >> $LOGFILE 2>&1
