#!/bin/bash

#Description: Centos7_audit
#Author: Larisa
#Date: 01/25/2020

echo -e "\nPlease wait while we perform an audit on your system\n"
sleep 10
if [ -f /etc/hosts ]
then
echo -e "\nFile /etc/hosts exist on the system\n"
else 
echo -e "\nFile /etc/hosts doesn't exist on the system\n"
fi
echo -e "\nSELinux is set to $(getenforce)\n"
grep ^nobody /etc/passwd > /dev/null 2>&1
if
[ $? -eq 0 ]
then
echo -e "\nUser nobody exist on the system\n"
else 
echo -e "\nUser nobody doesn't exist on the system\n"
fi
echo -e "\nThe uid of user nobody is $(grep ^nobody /etc/passwd |awk -F":" '{print $3}')\n"
 rpm -qa |grep samba > /dev/null 2>&1
 if 
 [ $? -eq 0 ]
 then
 echo -e "\nSamba is installed on the system\n"
else
echo -e "\nSamba is not installed on the system\n"
fi
 echo -e "\nauditd is $( systemctl is-enabled auditd) and  $(systemctl is-active auditd)\n"
find /var/log/*sudo.log > /dev/null 2>&1
if 
[ $? -eq 0 ]
then
echo -e "\nsudo tool has logfile configured\n"
else
echo -e "\nsudo tool has no logfile configured\n"
fi
ROOT_OWNER=$(ls -l /etc/group |awk '{ if ($3 == "root") print $3}')
if 
[ $ROOT_OWNER = root ]
then
echo -e "\nOwner of /etc/group file is root\n"
else
echo -e "\nOwner of /etc/group is not root\n"
fi
rpm -qa |grep curl > /dev/null 2>&1
if
[ $? -eq 0 ]
then
echo -e "\ncurl command is installed\n"
else
echo -e "\ncurl command is not installed\n "
fi
rpm -qa |grep docker > /dev/null 2>&1
if
[ $? -eq 0 ]
then
echo -e "\n docker is installed\n"
else
echo -e "\ndocker is not installed\n"
fi
echo -e "\nTotal size of the memory is $(free -m |awk 'NR ==2{print $2}')\n"
echo -e "\nFirst digit of kernel version is $( uname -r |awk -F"." '{print $1}')\n"
echo -e "\nThe system is $(getconf LONG_BIT) bits\n"
if
[ -f /etc/sysconfig/network ]
then
echo -e "\n/etc/sysconfig/network file exist\n"
else
echo -e "\n/etc/sysconfig/network file doesn't exit\n"
fi
grep 8.8.8.8 /etc/resolv.conf > /dev/null 2>&1
if 
[ $? -eq 0 ]
then 
echo -e "\n/etc/resolv.conf file has dns entry with 8.8.8.8\n"
else
echo -e "\n/etc/resolv.conf file does not have dns entry with 8.8.8.8\n"
fi
echo -e "\nThe ip address of the system is $(ifconfig enp0s3|grep 'inet '|awk '{print $2}')\n"
echo -e "\nThe linux flavor running is $(grep ^ID= /etc/os-release |awk -F"=" '{print $2}')  and the version is $(grep ^VERSION_ID= /etc/os-release |awk -F"=" '{print $2}')\n"
echo -e "\nThe system hostname is $(hostname)\n"
echo -e "\nThe system has $(nproc) cpu\n"
grep wheel /etc/group > /dev/null 2>&1
if
[ $? -eq 0 ]
then
echo -e "\nGroup wheel exist on the system\n"
else
echo -e "\nGroup wheel doesn't exist on the system\n"
fi
grep deploy /etc/group > /dev/null
if 
[ $? -eq 0 ]
then
echo -e "\nGroup deploy exist on the system\n"
else
echo -e "\nGroup deploy does not exist on the system\n"
fi
echo -e "\nThank you for your time,and we hope you enjoyed our services\n"

