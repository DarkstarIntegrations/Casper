#!/bin/sh

# Name: ea_checkSharingNameAD.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Extension Attribute checks Sharing Name and Active Directory bound name match.
# Output: 0 = Name Does Not Match, 1 = Name Match, enter your own values if necessary.

# Read Active Directory Object Bound
adObject=`dsconfigad -show | awk '/Computer Account/{print $NF}' | tr '[a-z]' '[A-Z]' | sed s/.$//`
  # Uncomment To Test Command
  # echo $adObject

# Read Local Computer Name
sharingName=`scutil --get ComputerName`
  # Uncomment To Test Command
  # echo $sharingName

# Verify Sharing Name and Change if Needed
if [ "$adObject" != "$sharingName" ] ; then
  # 0 = Name does not match
  echo "<result>0</result>"
  # Optional Output, log computer name mismatches to logfile for archiving or future investigations.
  # echo "`date -u`: $loggedInUser - Computer Name Does Not Match" >> /Library/Logs/YOURLOGDIR/YOURLOGFILE.log
    else
  # 1 = Name match
  echo "<result>1</result>"
fi
