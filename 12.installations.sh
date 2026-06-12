#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error:: command run with root user privilizes"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: Please check once the command."
    exit 1
else
    echo "mysql installing successfully."
fi