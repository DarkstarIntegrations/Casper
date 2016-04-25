#!/bin/sh

# Name: ea_pgpBootGuardStat.sh
# Author: matt.lee@darkstarintegrations.com
# Description: PGP Drive Encryption Status

# Get Disk Bootguard Status
pgpBootStat=`/usr/local/bin/pgpwde --disk-status | sed -n 1p`
formatBootStat=${pgpBootStat:0:7}
# Test Output
# echo $formatBootStat

#Check to see if PGP is installed
if [ "$formatBootStat" == "" ]; then
  echo "<result>Not Instrumented</result>"
    else
  echo "<result>$formatBootStat</result>"
fi
