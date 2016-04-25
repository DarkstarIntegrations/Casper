#!/bin/sh

# Name: ea_statusARD.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Extension Attribute to display current Apple Remote Desktop status.

# Checks Apple Remote Desktop Status
ardStatus=`cat /private/etc/RemoteManagement.launchd`
# Get Current Logged In User for Logging Only. Uncomment if logging will be used.
# loggedInUser=$(ls -l /dev/console | awk '{ print $3 }')

# Reports Current ARD Status
if [ "$ardStatus" == "enabled" ] ; then
echo "<result>Enabled</result>"
  else
echo "<result>Disabled</result>"
# Logs Date, Current User, and Remote Desktop Status for Audit Archive
# echo "`date -u`: $loggedInUser - Remote Desktop Disabled" >> /Library/Logs/YOURLOGDIR/YOURLOGFILE.log
fi
