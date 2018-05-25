#!/bin/bash

# ----------------------------------------------------------------------------------
# Script for checking the temperature reported by the ambient temperature sensor,
# and if deemed to high send the raw IPMI command to enable dynamic fan control.
# ----------------------------------------------------------------------------------

# TEMPERATURE
# Change this to the temperature in celcius you are comfortable with.
# If the temperature goes above the set degrees it will send raw IPMI command to enable dynamic fan control
MAXTEMP=27

# This variable sends a IPMI command to get the temperature, and outputs it as two digits.
TEMP=$(ipmitool sdr type temperature |grep Ambient |grep degrees |grep -Po '\d{2}' | tail -1)


if [[ $TEMP > $MAXTEMP ]];
  then
    printf "Warning: Temperature is too high! Activating dynamic fan control! ($TEMP C)" | systemd-cat -t R710-IPMI-TEMP
    ipmitool raw 0x30 0x30 0x01 0x01
  else
    printf "Temperature is OK ($TEMP C)" | systemd-cat -t R710-IPMI-TEMP
    echo "Temperature is OK ($TEMP C)"
fi