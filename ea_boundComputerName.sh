#!/bin/sh

# Name: ea_boundComputerName.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Displays bound Active Directory name as an Extension Attribute.

# Get Active Directory bound name
boundName=`dsconfigad -show | awk '/Computer Account/{print $NF}' | tr '[a-z]' '[A-Z]' | sed s/.$//`

# Script Contents Below
if [ "$boundName" == "" ] ; then
  echo "<result>Not Bound</result>"
    else
  echo "<result>$boundName</result>"
fi

exit 0
