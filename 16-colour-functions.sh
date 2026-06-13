#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "Error:: run command with root user privilizes."
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Failure:: $R $2 $N Command Not Found."
        exit 1
    else
        echo "Success:: Proceed with installation."
    fi
}

dnf list installed mysql 
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? MySql
else 
    echo -e "MySql already installed $Y Skipping...$N"
fi

