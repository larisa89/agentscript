#!/bin/bash
#Description: System Check
#Author: Larisa
echo -e "\nSystem Inventory Check\n"
echo -e "\nPlease wait while we do a quick inventory check on the System\n"
sleep 3
echo -e "\nTotal memory is $(free -m |awk 'NR ==2{print $2}')\n"
echo The system has $(nproc) cpu
grep wheel /etc/group > /dev/null
if
[ $? -eq 0 ]
then
echo -e "\nGroup wheel exist on the system\n"
else
echo -e "\nGroup wheel doesn't exist on the system\n"
fi
grep deploy /etc/passwd > /dev/null
if
[ $? -eq 0 ]
then
echo -e "\nUser deploy exist on the system\n"
else
echo -e "\nUser deploy doesn't exist on the system\n"
fi
grep deploy /etc/group > /dev/null
if
[ $? -eq 0 ]
then
echo -e "\nGroup deploy exist on the system\n"
else
echo -e "\nGroup deploy doesn't exist on the system\n"
fi
 echo -e "\nSELinux is set to $(getenforce)\n"

lsblk |awk 'NR ==2{print $1 "  " $4}'

echo -e "\nThank you for your time and do have a nice day!!!\n"


