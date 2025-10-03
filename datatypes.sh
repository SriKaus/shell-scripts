#!/bin/bash
num1=3344
num2=945
Movie="Kantara"
summ=$(($num1+$num2+$Movie))
echo "The sum of $num1 and $num2 is $summ"

Names=("Kannada","Karnataka","KGF","Kantara","Milana")
echo "The names are : ${Names[@]}"
echo "The first name is :${Names[1]}"
echo "The last name :${Names[10]}"