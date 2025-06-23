import json
import subprocess
from pynput import keyboard

HOTKEY_CONFIG = "/home/rjones/scripts/hotkey/hotkey.json"

# Map string keys to pynput Key or KeyCode
SPECIAL_KEYS = {
    "alt": keyboard.Key.alt,
    "ctrl": keyboard.Key.ctrl,
    "shift": keyboard.Key.shift,
    "cmd": keyboard.Key.cmd,      # Super/Windows key on Linux/Mac
    "super": keyboard.Key.cmd,
    "enter": keyboard.Key.enter,
    "esc": keyboard.Key.esc,
    "space": keyboard.Key.space,
    "tab": keyboard.Key.tab,
    "backspace": keyboard.Key.backspace,
}

def parse_key(k):
    """Converts a key string to a pynput Key or KeyCode"""
    k_lower = k.lower()
    return SPECIAL_KEYS.get(k_lower, keyboard.KeyCode.from_char(k_lower))

def load_hotkeys():
    """Load hotkey mappings from JSON"""
    with open(HOTKEY_CONFIG, "r") as f:
        data = json.load(f)

    hotkey_map = {}
    for entry in data:
        keys = frozenset(parse_key(k) for k in entry["keys"])
        hotkey_map[keys] = entry["command"]
    return hotkey_map

hotkeys = load_hotkeys()
pressed_keys = set()

def on_press(key):
    pressed_keys.add(key)
    for combo, command in hotkeys.items():
        if combo.issubset(pressed_keys):
            print(f"Running: {command}")
            subprocess.Popen(command, shell=True)

def on_release(key):
    pressed_keys.discard(key)

print("🔑 Hotkey listener running...")
with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
    listener.join()
