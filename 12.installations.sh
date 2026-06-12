#!/bin/bash

if [ $? -ne 0 ]; then
    echo "mysql not installed..! Proceed"
    dnf install mysql -y
else 
    echo "mysql already installed..!"
fi