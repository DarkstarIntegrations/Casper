#!/bin/bash

# Name: script_adminManager.sh
# Author: matt.lee@darkstarintegrations.com 
# Description: ADmin Manager 2.0.1 is an Active Directory Local Administrative rights management script created by Matt Lee in order to manage Admin Rights using JAMF Casper. This script will retrieve the local user name, determine if the user is a member of the /Groups/Admin local group, and then verify that said user is in the correct Active Directory group. If the user is not in the AD group rights will be removed else if users are in the group rights will be appended if needed. This script will also log activities for archiving and other security audit purposes.

# Get Logged In User
loggedInUser=$(ls -l /dev/console | awk '{ print $3 }')
# Test Output
# echo $loggedInUser

# Get Realname
FullName=$(dscl . -read /Users/"$loggedInUser" RealName | awk 'BEGIN {FS=": "} {print $1}')
realName=$(echo $FullName | awk '{print $2,$3}')

# Extract Username From Local Admin List
groupMembership=$(dscl localhost read /Local/Default/Groups/admin GroupMembership | tr " " "\n" | grep "$loggedInUser")
# Test Output
# echo $groupMembership

# Active Directory Local Admin Group Name
adGroupName="ADGROUPNAME"

# Active Directory Domain
adDomain="ADDOMAIN"

# Verify Username Not Present Already In Active 
adGroup=$(dscl "/Active Directory/$adDomain/All Domains" -read /Groups/$adGroupName member | grep -o "$realName")
#Test Output
# echo $adGroup

# If User is in AD Admin Group but Not Local Admin
if [[ "$loggedInUser" == "$adGroup" && "$loggedInUser" != "$groupMembership" ]]; then
		dscl . append /Groups/admin GroupMembership "$loggedInUser"
            echo "`date -u`: $loggedInUser - Local Admin Rights Granted by by _casperagent" >> /Library/Logs/Logs/YOURLOGDIR/YOURLOGFILE.log
else
# If User is not in the AD  Group
if [[ "$loggedInUser" != "$adGroup" && "$loggedInUser" == "$groupMembership" ]]; then
		dscl . delete /Groups/admin GroupMembership "$loggedInUser"
        echo "`date -u`: "$loggedInUser" - Local Admin Rights Revoked by _casperagent" >> /Library/Logs/YOURLOGDIR/YOURLOGFILE.log
fi
