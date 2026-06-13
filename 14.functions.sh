#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then #here userid = 0 that is root user other than 0 not an root user.
    echo "Error::Plese run the command with root user privilizes."
    exit 1 # 0 is the success other than 0 is error output
fi

VALIDATE(){
   if [ $1 -ne 0 ]; then # functions take inputs from args like shell scripting args.
        echo "Error:: Command Not found Plese check once the command."
        exit 1
    else    
        echo "$2 Installed Successfully."
    fi 
}

# mysql installation:

dnf install mysql -y
VALIDATE $? MySql

# Nginx Installation:

dnf install nginx -y
VALIDATE $? Nginx

# python3 installation

dnf install python3 -y
VALIDATE $? Python3
