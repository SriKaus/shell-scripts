#!/bin/bash
echo "Enter the number"
read n
if [ $(($n%2)) -eq 0 ]
then
echo "The $n is even"
else
echo "The $n is odd"
fi

