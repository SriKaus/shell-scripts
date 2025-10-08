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

for pack in $@
do
dnf list installed $pack>>$log_file
if [ $? -ne 0 ] 
then
dnf install $pack -y>>$log_file
validate $? "$pack"
else
echo "The package $pack already exists .... skipping installation"
fi
done
fi