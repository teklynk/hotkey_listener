#!/bin/bash

play /usr/share/mint-artwork/sounds/plug.oga
notify-send "Hotkey listener running..."

# kill the script if it is already running
pkill -f hotkey_listener.py

# Activate venv
source /home/user/scripts/hotkey_listener/.venv/bin/activate

# Run the Python script and output to log file
python /home/user/scripts/hotkey_listener/hotkey_listener.py > /home/user/scripts/hotkey_listener/hotkey.log 2>&1