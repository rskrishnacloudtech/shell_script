#!/bin/bash

set -e
userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
filename=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$filename-$timestamp.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

validate_installation(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R FAILURE $N"
        exit 1
    else
        echo -e "$2... $G SUCCESS $N"
    fi
    }

if [ $userid -ne 0 ]
then
    echo "User is not sudo"
    exit 1
    else
        echo "You are sudo user. You can proceseed to install the packages."
fi

for i in $@
do
    echo "Package to install: $i"
    dnrrf list installed $i &>> $logfile
    if [ $? -eq 0 ]
    then
        echo -e "$i is already installed... $Y SKIPPING $N"
        dnf remove $i -i &>> $logfile
        else
            dnf install $i -y &>> $logfile
            validate_installation $? "Installation of $i"
    fi
done