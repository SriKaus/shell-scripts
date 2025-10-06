#!/bin/bash
User=$(id -u)
gr="\e[31m"
re="\e[32m"
validate(){
    if [ $1 -ne 0 ]
    then
    echo -e "Installing $2 .... $gr failed"
    else
    echo -e "Installing $2 .... $re Success"
    fi
}
if [ $User -ne 0 ]
then
echo "$gr Please try again with root permission"

else
dnf list installed  mysql

if [ $? -ne 0 ]
then
dnf install mysql
validate $? "mysql"
else
echo "The Package mysql already exists .... Skipping Installation" 
fi

dnf list installed  nginx

if [ $? -ne 0 ]
then
dnf install nginx
validate $? "nginx"
else
echo "The Package nginx already exists .... Skipping Installation" 
fi

dnf list installed  python3

if [ $? -ne 0 ]
then
dnf install python3
validate $? "python3"
else
echo "The Package python3 already exists .... Skipping Installation" 
fi

fi