#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];then
  echo "You must be root to run this script."
  exit 1
fi
validate_installation() {
  if [ $1 -ne 0 ];then
    echo " installation $2 is failure"
    exit 1
  else
    echo "$2 installed successfully."
  fi
} 

dnf install mysql -y
validate $? "MySQL" 

dnf install nginx -y
validate $? "Nginx" 

dnf install python3 -y
validate $? "python3"

