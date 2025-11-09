#!/bash/bin

USERID=$(id -u)
if [ $USERID -ne 0 ];then
  echo "You must be root to run this script."
exit 1
fi
dnf install mysql -y
if[ $? -ne 0 ];then
  echo "MySQL installation failed."
exit 1
else
echo "MySQL installed successfully."
fi
