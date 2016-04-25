#!/bin/bash

# Name: script_tboltBridgeStat.sh
# Author: matthew.lee@barclayscapital.com
# Description: Script checks the current Thunderbolt Bridge status. "Enabled" is the trigger and will disable the service as well as log the activities to a logfile. The logfile will update the service status and the current user who was logged in when the out of compliance action was detected.

loggedInUser=$(ls -l /dev/console | awk '{ print $3 }')
# Test Output
# echo $loggedInUser

logDir="/Library/Logs/YOURLOGDIR/YOURLOGFILE.log"

bridgeStat=`networksetup -getnetworkserviceenabled "Thunderbolt Bridge"`
# Test Output
# echo $bridgeStat

bridgeOff=`networksetup -setnetworkserviceenabled "Thunderbolt Bridge" off`

if [ "$bridgeStat" == "Enabled" ] ; then
$bridgeOff
    echo "`date -u`: Status: Start" >> $logDir
    echo "`date -u`: Service: Thunderbolt Bridge" >> $logDir
    echo "`date -u`: Status: Disabling Service" >> $logDir
    echo "`date -u`: Current User: $loggedInUser" >> $logDir
    echo "`date -u`: Status: Complete" >> $logDir
    echo "Device Disabled"
else
    echo "Device in Compliance"
fi
