#!/bin/bash

userid=$(id -u)

if [ userid -ne 0 ]
then
    echo "User is not a sudo user."
    exit 1
fi

validate_installation(){
    if [ $1 -ne 0 ]
    then
        echo "$2... installation operation is FAILED"
        exit 1
    else
        echo "$2... installation operation is SUCCESS"
}

dnf install mysql -y
validate_installation $? "Installing mysql"