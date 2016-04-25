#!bin/sh

# Name: ea_checkPointVer.sh
# Author: matt.lee@darkstarintegrations.com
# Description: # Extension Attrivute using Plistbuddy instead of awk to grab Checkpoint Version.

# Plist buddy calls the value holding the version number
cpVersion=`/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" /Applications/Endpoint\ Security\ VPN.app/Contents/Info.plist`
# Echo Results
echo "<result>$cpVersion</result>"
