#!/bin/bash

scrip2var="This is the variable from script2"

echo "This is the varibale from script 2: $scrip2var"
echo "This the pid of the sript 2: $$"

#calling script1 into script2
./script1.sh

echo "This is the varaible value of script1: $scrip1var"
echo "This the pid of the sript 1: $$"