#!/bin/bash

# HOW TO USE
# Add following command on "crontab -e" then "rsync" will backup files from SRC to DST.

# cron command
#* * * * * cd /home/mkaise/git/demo-rsync; ./rsync_backup_usb.sh 1>> ./log_result.txt 2>&1

# backup configulation
src_path="src/"
dst_path="/media/mkaise/usbmem_red/backup-latest"
log_file="log_rsync.txt"
timestamp=$(date +%Y%m%d-%H%M%S)

# backup command to be executed by cron
if rsync -ah --delete --log-file=$log_file --backup --backup-dir="../backup-$timestamp" $src_path $dst_path;
then
  echo "$timestamp" "rsync completed successfully."
  exit 0
else
  echo "$timestamp" "rsync failed."
  exit 1
fi