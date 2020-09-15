#!/bin/bash

find /var/log/*.log -mtime +14 -exec chmod u+x {} \;

