#!/bin/bash
dates1=$(date +%s)
free
lsblk
df -h
uptime
dates2=$(date +%s)
Totaltime=$(($dates2-$dates1))
echo "The total time taken to execute the script is $Totaltime"

