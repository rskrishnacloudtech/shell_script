#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "This user is not a sudo user. Please get the sudo access"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "This my sql server installation is not completed successfully"
fi

echo "Still continuing the execution"