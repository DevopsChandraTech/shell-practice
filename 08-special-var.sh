#!/bin/bash

echo "pass all arguments into script: $@"

echo "pass all arguments into script: $*"

echo "the script name is: $0"

echo "current working directory of the script : $PWD"

echo "who is running the script : $USER"

echo "home directory of the script: $HOME"

echo "PID of the Script : $!"

sleep 50 & # sleep 50 secs in baground

echo "PID of the last command: $$"