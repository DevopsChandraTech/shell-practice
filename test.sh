#!/bin/bash
#mysql installation

echo "the script start executed in $(date)"
START_TIME=$(date +%s)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u) # show user id

if [ $USERID -ne 0 ]; then
    echo "Error:: run command with root user privilizes"
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error:: command not found"
    else
        echo -e "$2 Installing $G Success.$N"
    fi
}

dnf list installed mysql 

if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? MySql
else 
    echo -e "MySql already installed $Y Skipping...!$N"
fi

END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "Script Executed in $TOTAL_TIME Secs."