#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} 

START_TIME=$(date +%s)

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "Error:: run command with root user privilizes."
    exit 1
fi

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | awk -F "." '{print $1}') # (or echo $0 | cut -d '.' -f1)
FILE_NAME="/$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER


USAGE(){
    echo -e "$R sudo sh 24-backup.sh <source-dir> <dest-dir> <days [optional,default 14 days]> $N"
    exit 1
}
    
if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then #SOURCE_DIR=/home/ec2-user/source-dir
    echo "Error:: Source $SOURCE_DIR Does not exist..!"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then #DEST_DIR=/home/ec2-user/dest-dir
    echo "Error:: Destination $DEST_DIR Does not exist..!"
    exit 1
fi

FILES=$(find $SOURCE_DIR -type f -name "*.log" -mtime +$DAYS)

if [ ! -z "${FILES}" ]; then
    echo "files found : $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "zip file name is : $ZIP_FILE_NAME"
    find $SOURCE_DIR -type f -name "*.log" -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

    if [ -f $ZIP_FILE_NAME ]
    then
        echo -e "Archival is $G SUCCESS $N"
        while IFS= read -r filepath
        do
            echo "Deleting the file: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"
        done <<< $FILES
    else
        echo -e "Archival is $R FAILURE $N"
        exit 1
    fi

else
    echo "files not found directory empty"
fi


