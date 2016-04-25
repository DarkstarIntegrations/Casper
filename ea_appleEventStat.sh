#!/bin/bash

# Name: ea_appleEventStat.sh
# Author: matt.lee@darkstarintegrations.com
# Description: Extension Attribute displays Apple Remote Event status.

# Getting Apple Remote Event Status
eventStatus=`systemsetup -getremoteappleevents | sed 's/Remote Apple Events: //g'`
# Displays On or Off
  echo "<result>$eventStatus</result>"
