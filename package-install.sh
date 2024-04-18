#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%M-%H-%S)
filename=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$filename-$timestamp.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]
then
    echo "User is not sudo"
    exit 1
fi
validate_installation(){
    if [ $1 -ne 0]
    then
        echo -e "$2... $R FAILURE $N"
        exit 1
        else
            echo -e "$2... $G SUCCESS $N"
}

for i in $@
do
    echo "Package to install"
    dnf list installed $i &>> $logfile
    if [ $? -eq 0 ]
    then
        echo -e "$i is already installed... $Y SKIPPING $N"
        
        else
            dnf install $i -y &>> $logigle
            validate_installation $? "Installation of $i"
    fi
done