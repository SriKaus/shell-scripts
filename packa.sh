#!/bin/bash
User=$(id -u)
gr="\e[31m"
re="\e[32m"
nr="\e[0m"
fold="/var/log/shell-scripts"
script_name=$( echo $0|cut -d '.' -f1 )
log_file="$fold/$script_name.logs"
mkdir -p $fold

validate(){
    if [ $1 -ne 0 ]
    then
    echo -e "Installing $2 .... $gr failed" $nr|tee -a $log_file
    else
    echo -e "Installing $2 .... $re Success" $nr|tee -a $log_file
    fi
}
if [ $User -ne 0 ]
then
echo -e "$gr Please try again with root permission $nr"

else
dnf list installed  mysql &>>$log_file

if [ $? -ne 0 ]
then
dnf install mysql
validate $? "mysql"
else
echo "The Package mysql already exists .... Skipping Installation" |tee -a $log_file
fi

dnf list installed nginx &>>$log_file

if [ $? -ne 0 ]
then
dnf install nginx
validate $? "nginx"
else
echo "The Package nginx already exists .... Skipping Installation"|tee -a $log_file 
fi

dnf list installed  python3 &>>$log_file

if [ $? -ne 0 ]
then
dnf install python3
validate $? "python3"
else
echo "The Package python3 already exists .... Skipping Installation"|tee -a $log_file
fi

fi