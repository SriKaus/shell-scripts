#!/bin/bash
Usr=$(id -u)

if [ "$Usr" -ne 0 ]
then
echo "No root access pls come with root privilige"
else
echo "Enter the package to be installed"
read -r pack
dnf install "$pack" -y
if [ $? -eq 0 ]
then
echo "The package $pack is successfully installed"

else
echo "Error while installing the package"
fi
fi