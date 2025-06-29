#!/bin/bash

# Check if Bluetooth is on or off
status=$(bluetoothctl show | grep "Powered: yes")

if [ -n "$status" ]; then
  # Bluetooth is currently on, so turn it off
  echo "Turning Bluetooth off..."
  bluetoothctl power off
  play /usr/share/mint-artwork/sounds/unplug.oga
  notify-send "Bluetooth disabled."
else
  # Bluetooth is currently off, so turn it on
  echo "Turning Bluetooth on..."
  bluetoothctl power on
  play /usr/share/mint-artwork/sounds/plug.oga
  notify-send "Bluetooth enabled."
fi

# Notify blueman-manager of the change
#blueman-manager --refresh