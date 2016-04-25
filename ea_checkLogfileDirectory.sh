#!/bin/bash

# Name: ea_checkLogfileDirectory.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Extension Attribute to determine whether corporate logfile directories are installed.

# Log File Directory Location
logDir="/Library/Logs/YOURLOGDIR/YOURLOGFILE.log"

# If Log File Directory Doesn't Exist, Make Directory
if [ ! -d $logDir ] ; then
echo "<result>Not Installed</result>"
else
echo "<result>Installed</result>"
fi
