#!/bin/bash

USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
  echo "You must be root to run this script."
  exit 1
fi

# usage: validate <exit_code> <name>
validate() {
  if [ "$1" -ne 0 ]; then
    echo "ERROR: $2 installation failed."
    exit 1
  else
    echo "$2 installed successfully."
  fi
}

# MySQL server (use 'mariadb-server' if 'mysql-server' isn't available)
dnf -y install mysql-server
validate $? "MySQL server"

# Nginx
dnf -y install nginx
validate $? "Nginx"

# Python 3
dnf -y install python3
validate $? "Python 3"
