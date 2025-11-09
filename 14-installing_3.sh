# #!/bin/bash

# USERID=$(id -u)
# if [ $USERID -ne 0 ];
# then
#   echo "You must be root to run this script."
#     exit 1
# fi
# dnf install mysql -y
# if[ $? -ne 0 ];
# then
#   echo "ERRor:MySQL installation failed."
#   exit 1
#   else
# echo "MySQL installed successfully."
# fi

!/bin/bash

USERID=$(id -u)

# Check if the user is root
if [ $USERID -ne 0 ]; then
  echo "You must be root to run this script."
  exit 1
fi

# Install MySQL
dnf install mysql -y

# Check if the installation was successful
if [ $? -ne 0 ]; then
  echo "ERROR: MySQL installation failed."
  exit 1
else
  echo "MySQL installed successfully."
fi
