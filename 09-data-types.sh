#!/bin/bash

NUMBER1=200
NUMBER2=300

NAME=Chandra

SUM=$(($NUMBER1 + $NUMBER2 + $NAME))
echo "sum of the numbers is: ${SUM}"

FAMILY=("Amma" "Chandra" "Anu" "Gnapika" "Hansith")

echo "all members of the family is : ${FAMILY[@]}"
echo "head of the family is: ${FAMILY[0]}"
echo "eldest of the family is: ${FAMILY[4]}"

