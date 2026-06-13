#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then # root user id is 0 other than root numbers
    echo "Error:: Run command with root user privilizes."
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then # functions take inputs from args just like shell script args
        echo "Error:: Installing $2 Failure."
        exit 1
    else    
        echo "Installing $2 Success."
    fi
}

dnf install mysql -y
VALIDATE $? MySql

dnf install nginx -y
VALIDATE $? Nginx

dnf install python3 -y
VALIDATE $? Python3