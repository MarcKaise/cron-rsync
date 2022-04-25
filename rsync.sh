#!/bin/bash

# HOW TO USE
# Add following command on "crontab -e" then "rsync" will backup files from SRC to DST.

# cron command
#02 6 * * * cd //home/mkaise/git/cron-rsync; ./rsync.sh 1>> ./log_cron.txt 2>&1

# backup configulation
src_path="/mnt/nas/"
dst_path="/mnt/backup/backup-latest"
log_file="log_rsync.txt"
timestamp=$(date +%Y%m%d-%H%M%S)

# backup command to be executed by cron
if rsync -rlt --delete --log-file=$log_file --backup --backup-dir="../backup-$timestamp" $src_path $dst_path;
then
  echo "$timestamp" "rsync completed successfully."
  exit 0
else
  echo "$timestamp" "rsync failed."
  exit 1
fi