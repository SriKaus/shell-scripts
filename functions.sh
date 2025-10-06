#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
echo "Error:Please try again with root access"
exit 1

fi
valid(){
if [ $1 -eq 0 ]
then
echo "The package $2 is successfully installed"
else
echo "Error:While Installing $2 package"
fi   
}

dnf install mysql -y
valid $? "Mysql"

dnf install nginx -y
valid $? "Nginx"

dnf install python3 -y
valid $? "Python3"
