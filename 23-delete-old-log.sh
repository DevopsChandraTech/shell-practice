#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

START_TIME=$(date +%s)

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "Error:: run command with root user privilizes."
    exit 1
fi


LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | awk -F "." '{print $1}') # (or echo $0 | cut -d '.' -f1)
FILE_NAME="/$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR=/home/ec2-user/app-logs

mkdir -p $LOGS_FOLDER

# check directory exist or not
# find the logs inside the directory
# delete old logs

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -name "*.log" -mtime +14)

$SOURCE_DIR
if [ ! -d $SOURCE_DIR ]; then
    echo "Error:: $SOURCE_DIR not found"
    exit 1
fi

while IFS= read -r filepath 
do
    echo "deleted file is : $filepath"

done <<< $FILES_TO_DELETE


# # Check if the input file exists
# if [ ! -f "orphaned_files.txt" ]; then
#   echo "File orphaned_files.txt not found!"
#   exit 1
# fi

# # Loop through each line and delete the file
# while IFS= read -r file; do
#   if [ -f "$file" ]; then
#     rm "$file"
#     echo "Deleted: $file"
#   else
#     echo "File not found: $file"
#   fi
# done < "orphaned_files.txt"   