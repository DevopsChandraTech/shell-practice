#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "Error:: run command with root user privilizes."
    exit 1
fi


LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | awk -F "." '{print $1}') # (or echo $0 | cut -d '.' -f1)
FILE_NAME="/$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then # $1 is first arg for $? and $2 is 2nd arg for MySql
        echo -e "Failure:: $R $2 $N Command Not Found."
        exit 1
    else
        echo "$2 Installing $G Success $N."
    fi
}

#mysql installation
dnf list installed mysql &>> $FILE_NAME # check the list of installed packages available
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> $FILE_NAME
    VALIDATE $? MySql
else 
    echo -e "MySql already installed $Y Skipping...$N"
fi

#nginx installation
dnf list installed nginx &>> $FILE_NAME
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> $FILE_NAME
    VALIDATE $? Nginx
else 
    echo -e "Nginx already installed $Y Skipping...$N"
fi

#Python3 installation
dnf list installed python3 &>> $FILE_NAME
if [ $? -ne 0 ]; then
    dnf install python3 -y &>> $FILE_NAME
    VALIDATE $? Python3
else 
    echo -e "Python3 already installed $Y Skipping...$N"
fi

#Unzip installation
dnf list installed unzip &>> $FILE_NAME
if [ $? -ne 0 ]; then
    dnf install unzip -y &>> $FILE_NAME
    VALIDATE $? Unzip
else 
    echo -e "Unzip already installed $Y Skipping...$N"
fi


