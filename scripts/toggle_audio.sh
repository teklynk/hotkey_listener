#!/bin/bash

# pactl list short sinks
#61	alsa_output.usb-SteelSeries_SteelSeries_Arctis_1_Wireless-00.analog-stereo	PipeWire	s16le 2ch 48000Hz	RUNNING
#63	alsa_output.pci-0000_00_1f.3.analog-stereo	PipeWire	s32le 2ch 48000Hz	SUSPENDED

# Set your actual sink names here
SPEAKERS="alsa_output.pci-0000_00_1f.3.analog-stereo"
HEADSET="alsa_output.usb-SteelSeries_SteelSeries_Arctis_1_Wireless-00.analog-stereo"

# Get the currently active default sink
CURRENT_SINK=$(pactl get-default-sink)

if [ "$CURRENT_SINK" = "$SPEAKERS" ]; then
    pactl set-default-sink "$HEADSET"
    # Move all current playing streams to the new sink
    pactl list short sink-inputs | while read -r input; do
        pactl move-sink-input $(echo "$input" | cut -f1) "$HEADSET"
    done
    echo "Switched to headset"
    play /usr/share/mint-artwork/sounds/plug.oga
    notify-send "Switched to headset"
else
    pactl set-default-sink "$SPEAKERS"
    pactl list short sink-inputs | while read -r input; do
        pactl move-sink-input $(echo "$input" | cut -f1) "$SPEAKERS"
    done
    echo "Switched to speakers"
    play /usr/share/mint-artwork/sounds/plug.oga
    notify-send "Switched to speakers"
fi
