#!/bin/bash

# Name: script_logfileDirectory.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Create logfile if it does not exist.

# Log File Directory Location
logDir="/Library/Logs/YOURLOGDIR"

# If Log File Directory Doesn't Exist, Make Directory
if [ ! -d $logDir ] ; then
  mkdir $logDir
else
  exit 0
fi
