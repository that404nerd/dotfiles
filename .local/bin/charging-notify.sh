#!/bin/sh

# Send a notification displaying that the battery is charging or discharging
# Pass 1 as an argument for charging, 0 for discharging
# Example usage: chargingnotify 1

# Check if argument is passed
[ $# != 1 ] && printf '0 or 1 must be passed as an argument.\nUsage: %s 0|1\n' "$0" && exit

export XAUTHORITY=$HOME/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_CHARGING=$1
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

case $1 in
  1)
  notify-send "Charging" "${BATTERY_LEVEL}% charged"
  ;;
  0)
  notify-send "Discharging" "${BATTERY_LEVEL}% remanining"
  ;;
esac
