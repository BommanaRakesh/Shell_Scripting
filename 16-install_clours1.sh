#!/bin/bash

# Color codes
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
N="\e[0m"   # Normal (reset)

USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
  echo -e "${R}You must be root to run this script.${N}"
  exit 1
fi

# usage: validate <exit_code> <package_name>
validate() {
  if [ "$1" -ne 0 ]; then
    echo -e "${R}ERROR: $2 installation failed.${N}"
    exit 1
  else
    echo -e "${G}$2 installed successfully.${N}"
  fi
}

# -------------------------------
# MySQL (use mariadb-server if mysql not found)
# -------------------------------
dnf list installed mysql &>/dev/null
if [ $? -ne 0 ]; then
  echo -e "${Y}Installing MySQL...${N}"
  dnf install -y mysql
  validate $? "MySQL"
else
  echo -e "${G}MySQL is already installed. Skipping.${N}"
fi

# -------------------------------
# NGINX
# -------------------------------
dnf list installed nginx &>/dev/null
if [ $? -ne 0 ]; then 
  echo -e "${Y}Installing Nginx...${N}"
  dnf install -y nginx
  validate $? "Nginx"
else
  echo -e "${G}Nginx is already installed. Skipping.${N}"
fi

# -------------------------------
# PYTHON3
# -------------------------------
dnf list installed python3 &>/dev/null
if [ $? -ne 0 ]; then 
  echo -e "${Y}Installing Python 3...${N}"
  dnf install -y python3
  validate $? "Python 3"
else
  echo -e "${G}Python 3 is already installed. Skipping.${N}"
fi
