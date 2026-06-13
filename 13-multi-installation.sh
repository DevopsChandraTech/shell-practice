#!/bin/bash

USERID=$(id -u) # if id=0 that is the root user other wise normal user

if [ $USERID -ne 0 ]; then
    echo "Error:: Command run with superuser privilizes"
    exit 1
fi

# mysql installation
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: command not found pls check and try again"
    exit 1
else
    echo "MySql Installed Successfully."

# nginx installation
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Error:: command not found pls check and try again"
    exit 1
else
    echo "MySql Installed Successfully."


# mongodb client installation
dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then
    echo "Error:: command not found pls check and try again"
    exit 1
else
    echo "MySql Installed Successfully."

