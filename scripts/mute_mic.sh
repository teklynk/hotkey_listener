#!/bin/bash

# Refresh PulseAudio state
pactl info &> /dev/null

# Get the current default source (microphone) name
DEFAULT_SOURCE=$(pactl info | grep "Default Source" | cut -f3 -d" ")

# Debugging: Print the default source
echo "Default Source: $DEFAULT_SOURCE"

# Check if the default source name was found
if [ -z "$DEFAULT_SOURCE" ]; then
    echo "Error: Default source not found."
    exit 1
fi

# Toggle the mute state of the default source
pactl set-source-mute "$DEFAULT_SOURCE" toggle

# Sleep for a short time to allow PulseAudio to update the state
sleep 1

# Get the updated mute status of the current default source
MUTE_STATUS=$(pactl list sources | grep -A 10 "$DEFAULT_SOURCE" | grep "Mute:" | awk '{print $2}')

# Debugging: Print the mute status
echo "Mute Status: $MUTE_STATUS"

# Check if the mute status was found
if [ -z "$MUTE_STATUS" ]; then
    echo "Error: Mute status not found."
    exit 1
fi

# Send a notification based on the mute status and play a sound effect
if [ "$MUTE_STATUS" = "yes" ]; then
    play /usr/share/mint-artwork/sounds/close.oga
    notify-send "MIC - OFF"
else
    play /usr/share/mint-artwork/sounds/map.oga
    notify-send "MIC - ON"
fi
