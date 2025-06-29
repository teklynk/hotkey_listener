#!/bin/bash

echo "Your system will lock in ..."
# Countdown from 3 seconds
for i in {3..1}; do
  echo "$i"
  sleep 1
  if [ $? -ne 0 ]; then
    echo "Countdown interrupted. No lock."
    exit 0
  fi
done
#light-locker-command --lock
#gnome-session-quit --lock
cinnamon-screensaver-command -l
#xdg-screensaver lock