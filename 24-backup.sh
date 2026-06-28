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

USAGE(){
    echo -e "$R sh 24-backup.sh <source-dir> <dest-dir> <days [optional,default 14 days]> $N"
    exit 1
}
    
if [ $# -le 2 ]; then
    USAGE
fi

