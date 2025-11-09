#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
  echo "You must be root to run this script."
  exit 1
fi

# usage: validate <exit_code> <name>
validate() {
  if [ "$1" -ne 0 ]; then
    echo "ERROR: $2 ... $R installation failed $N"
    exit 1
  else
    echo "$2 ... $2 installed successfully $N"
  fi
}

# MySQL server (use 'mariadb-server' if 'mysql-server' isn't available)
dnf list installed mysql
#install if it is not found
if [ $? -ne 0 ]; then
  dnf install mysql -y
  validate $? "MYSQL"
else
  echo "MySQL server is already installed. $G Skipping $N"
fi

dnf list installed nginx
#install if it is not found
if [ $? -ne 0 ]; then 
  dnf install nginx -y
  validate $? "Nginx"
else
  echo "Nginx is already installed. $G Skipping $N"
fi

dnf list installed python3
#install if it is not found
if [ $? -ne 0 ]; then 
  dnf install python3 -y
  validate $? "Python 3"
else
  echo "Python 3 is already installed. $G Skipping $N"
fi

  
