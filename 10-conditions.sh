#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "given number $NUMBER less than 10."
else
    echo "given number $NUMBER greater than or equal to 10"
fi