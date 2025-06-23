
# 🧠 Step-by-Step Usage

## ✅ 1. Install Dependencies (in venv)
```bash
cd ~/hotkey
source .venv/bin/activate
pip install pynput
```

## ✅ 2. Add a Launcher Script: run.sh
This ensures the virtual environment is activated when running the listener:
```bash
#!/bin/bash
# run.sh

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$DIR/.venv/bin/activate"
python "$DIR/hotkey_listener.py"
```
Make it executable:
```bash
chmod +x run.sh
```

## ✅ 3. Optional: Config-Based Hotkeys (hotkeys.json)
You can define hotkeys and commands in a JSON file:
```json
[
  {
    "keys": ["alt", "cmd", "4"],
    "command": "bash ~/scripts/my_script.sh"
  },
  {
    "keys": ["alt", "cmd", "t"],
    "command": "gnome-terminal"
  }
]
```
Then modify the Python script to read this file dynamically if you'd like. I can help with that too.

## ✅ 4. Run Script Manually
```bash
./run.sh
```

## ✅ 5. Optional: Autostart on Login (GUI Sessions)
You can create a .desktop file to run your hotkey listener at login:
```ini
# ~/.config/autostart/hotkey.desktop

[Desktop Entry]
Type=Application
Exec=/home/youruser/hotkey/run.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Hotkey Listener
Comment=Custom keyboard shortcut listener

```