#!/bin/bash

echo "All vaibles assd to th script are:$@"
echo "Allvariables passed to the script are:$*"
echo "script name:$0"
echo "current directory is:$PWD"
echo "current user is:$USER"
echo "home directory is:$HOME"
sleep 10 &
echo "PID of last background process is:$!"