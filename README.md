<div style="text-align:center;margin:4px;display:block;">
<img src="https://github.com/teklynk/hotkey_listener/blob/main/keyboard_macropad.jpg?raw=true" />
</div>

# What is this?
Hotkey Listener is a python service script that listens for key combinations and executes commands and scripts.

# Example use cases:

- Start and stop a docker container with a key combination
- Shutdown your computer with a key combination
- Open a terminal with a key combination  
- Open a web browser with a key combination
- Mute your microphone with a key combination
- Toggle bluetooth with a key combination
- Switch audo sources with a key combination

If you can script it, then you can run it with a keyboard shortcut.

# Usage

## Install Dependencies (in venv)
```bash
cd ~/hotkey_listener
source .venv/bin/activate
pip install pynput
```

## Add a Launcher Script: run.sh
This ensures the python virtual environment is activated when running the listener:

Rename `run.sample.sh` to `run.sh`

Open `run.sh` in a text editor and modify the paths for your environment.

Make it executable:
```bash
chmod +x run.sh
```

## Config-Based Hotkeys (hotkey.json)
Rename `hotkey.sample.json` to `hotkey.json`

Open `hotkey.json` in a text editor and add commands as needed. As you can see, you can execute bash scripts or open programs using a hotkey/key combination.

`scripts/` directory has some sample bash scripts that you can modfiy or use your own bash scripts. 

You can define hotkeys and commands in a JSON file:
```json
[
  {
    "keys": ["alt", "cmd", "4"],
    "command": "bash /home/user/my_script.sh"
  },
  {
    "keys": ["alt", "cmd", "t"],
    "command": "gnome-terminal"
  }
]
```
Then modify the Python script to read this file dynamically if you'd like. I can help with that too.

## Run Script Manually
```bash
./run.sh
```

## Optional: Autostart on Login (GUI Sessions)
You can create a .desktop file to run your hotkey listener at login:
```bash
# ~/.config/autostart/hotkey_listener.desktop

[Desktop Entry]
Type=Application
Exec=/home/user/scripts/hotkey_listener/run.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Hotkey Listener
Comment=Custom keyboard shortcut listener

```