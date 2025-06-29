#!/bin/bash

# Check the current status of WiFi using nmcli
status=$(nmcli -t -f WIFI g)

if [ "$status" = "enabled" ]; then
  # WiFi is currently on, so turn it off
  echo "Turning WiFi off..."
  nmcli radio wifi off
  play /usr/share/mint-artwork/sounds/unplug.oga
  notify-send "Turning WiFi off..."
else
  # WiFi is currently off, so turn it on
  echo "Turning WiFi on..."
  nmcli radio wifi on
  play /usr/share/mint-artwork/sounds/plug.oga
  notify-send "Turning WiFi on..."
fi