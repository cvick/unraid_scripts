#!/bin/bash

# ----------------------------------------------------------------------------------
# Script for setting manual fan speed to 2160 RPM (on my R710)
# ----------------------------------------------------------------------------------

printf "Activating manual fan speeds! (2160 RPM)" | systemd-cat -t R710-IPMI-TEMP
echo "Activating manual fan speeds! (2160 RPM)"

ipmitool raw 0x30 0x30 0x01 0x00
ipmitool raw 0x30 0x30 0x02 0xff 0x09

