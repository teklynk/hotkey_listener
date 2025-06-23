#!/bin/bash

play /usr/share/mint-artwork/sounds/plug.oga
notify-send "Hotkey listener running..."

# Activate venv
source /home/user/scripts/hotkey/.venv/bin/activate

# Run the Python script and output to log file
python /home/user/scripts/hotkey/hotkey_listener.py > /home/user/scripts/hotkey/hotkey.log 2>&1