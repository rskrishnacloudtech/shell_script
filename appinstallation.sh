#!/bin/bash

userid=${id -u}

if [$userid -ne 0]
then
    echo "This user is not a sudo user. Please get the sudo access"
fi

dnf install mysql-server -y

echo "Still continuing the execution"