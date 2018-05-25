#!/bin/bash

# ----------------------------------------------------------------------------------
# Script for using ipmitool to retrieve the ambient temperature from the motherboard
# and current watts being used from the PSU and print them to the front LCD
# ----------------------------------------------------------------------------------

# Get temperature (celsius) and assign it to a variable

TEMPA=$(ipmitool sdr type temperature | grep Ambient | grep degrees | grep -Po '\d{2}' | tail -1)

echo "$TEMPA"

# Get watts used and assign to a variable

POWER=$(ipmitool sdr type current | grep Watts | grep -Po '\d{3}')

echo "$POWER"

# Convert celsius to farenheit

TEMPB=$(($TEMPA * 9 / 5 + 32))

echo "$TEMPB"

# Set LCD to user string and combine temp and power info

screen=$"("$TEMPB" F | "$POWER" W)"

echo "$screen"

ipmitool delloem lcd set mode userdefined "$screen"
