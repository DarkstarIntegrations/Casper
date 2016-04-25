#!/bin/sh

# Name: ea_activeNetFace.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Extension Attribute displays current Network Service.

activeInterface=`/usr/sbin/networksetup -listnetworkserviceorder 2>&1 | grep $(/usr/sbin/netstat -rn 2>&1 | /usr/bin/grep -m 1 'default' | /usr/bin/awk '{ print $6 }') | sed -e "s/.*Port: //g" -e "s/,.*//g"`
# Test Output
# echo $activeInterface

OS_MINOR=`/usr/bin/sw_vers -productVersion | /usr/bin/cut -d . -f 2`
if (( $OS_MINOR < 5 )); then
  if [ -f /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/networksetup ];then   
    echo "<result>`/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/networksetup -listnetworkserviceorder 2>&1 | grep $(/usr/sbin/netstat -rn 2>&1 | /usr/bin/grep -m 1 'default' | /usr/bin/awk '{ print $6 }') | sed -e "s/.*Port: //g" -e "s/,.*//g"`</result>"
  else
    echo "<result>Device Not Active</result>"
  fi
else
  echo "<result>`/usr/sbin/networksetup -listnetworkserviceorder 2>&1 | grep $(/usr/sbin/netstat -rn 2>&1 | /usr/bin/grep -m 1 'default' | /usr/bin/awk '{ print $6 }') | sed -e "s/.*Port: //g" -e "s/,.*//g"`</result>"
fi
