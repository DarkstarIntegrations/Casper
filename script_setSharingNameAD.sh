#!/bin/sh

# Name: script_setSharingNameAD.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Computer Name Remediation Based on Active Directory Object.

# Read Active Directory Object Bound
adObject=`dsconfigad -show | awk '/Computer Account/{print $NF}' | tr '[a-z]' '[A-Z]' | sed s/.$//`
# Uncomment To Test Command
# echo $adObject

# Read Local Computer Name
sharingName=`scutil --get ComputerName`
# Uncomment To Test Command
# echo $sharingName

# Set Computer Name to Active Directory Object Name
setSharingName=`scutil --set ComputerName $adObject`
# Uncomment To Test Command
# echo #sharingName

# Verify Sharing Name and Change if Needed
if [ "$adObject" != "$sharingName" ] ; then
$setSharingName
# Optional Output, log computer name mismatches to logfile for archiving or future investigations.
# echo "`date -u`: $loggedInUser - Computer Synced by _casperagent" >> /Library/Logs/YOURLOGDIR/YOURLOGFILE.log
  echo "Remediation Complete"
else
  echo "In Compliance"
fi
