#!/bin/sh

# Name: ea_pgpCryptStat.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Extension Attribute to display PGP Encryption Disk Status.

# Get Disk Encryption Status
pgpCryptStat=`/usr/local/bin/pgpwde --disk-status | grep "Drive encrypted"`
# Test Output
# echo $pgpCryptStat

#Check to see if PGP is Activated
if [ "$pgpCryptStat" == "" ]; then
echo "<result>Not Encrypted</result>"
else
echo "<result>$pgpCryptStat</result>"
fi
