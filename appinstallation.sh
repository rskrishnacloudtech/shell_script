#!/bin/bash

# This will run id -u command and get the id of the user and stores it in userid variable.
userid=$(id -u)

# This checks that userid is 0 or not. if not 0 then print the message and exit here and dont execute other steps.
if [ $userid -ne 0 ]
then
    echo "This user is not a sudo user. Please get the sudo access"
    sudo su -
fi

# This comamnd will be executed if the user is 0 and installs the mysql.
dnf install mysql -y

# This will check that status of above command. If not 0 then it will print the message and exit here and dont execute other steps.
if [ $? -ne 0 ]
then
    echo "This my sql server installation is not completed successfully"
    exit 1
fi

echo "Still continuing the execution"