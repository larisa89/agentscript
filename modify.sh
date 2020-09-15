#!/bin/bash

#Description: Delete log files 14 days old
#Author: Larisa
#Date: 09/15/2020

echo -e "\nDeleting files 14 days older\n"

find /var/log/*.log -mtime +14 -exec rm -rf {} \;

