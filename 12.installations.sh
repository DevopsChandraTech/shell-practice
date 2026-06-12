#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]; then
    echo "Error:: command run with root user privilizes"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: Please check once the command."
else
    echo "mysql installing successfully."
fi