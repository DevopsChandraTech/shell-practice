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

VALIDATE(){
    if [ $1 -ne 0 ]; then # $1 is first arg for $? and $2 is 2nd arg for MySql
        echo -e "Failure:: $R $2 $N Command Not Found."
        exit 1
    else
        echo "$2 Installed Successfully."
    fi
}

#mysql installation
dnf list installed mysql # check the list of installed packages available
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? MySql
else 
    echo -e "MySql already installed $Y Skipping...$N"
fi

#nginx installation
dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? Nginx
else 
    echo -e "Nginx already installed $Y Skipping...$N"
fi

#Python3 installation
dnf list installed python3 
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? Python3
else 
    echo -e "Python3 already installed $Y Skipping...$N"
fi

