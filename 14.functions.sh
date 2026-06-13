#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error:: Run command with root user privilizes."
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error:: MySql Not installed."
    else    
        echo "$2 Already installed...! Skipping."
    fi
}

dnf install mysql -y
VALIDATE $? MySql

dnf install nginx -y
VALIDATE $? Nginx

dnf install python3 -y
VALIDATE $? Python3