#!/bin/bash

VAR="This is the variable from script2"

echo "Before calling other script: $VAR"
echo "This the pid of the sript 2: $$"

#calling script1 into script2 in WAY1.
#./script1.sh

#calling script1 into script2 in WAY1.
source ./script1.sh

echo "After calling other script: $VAR" 
echo "This the pid of the sript1: $$"