#!/bin/bash

echo "System will logout in ..."
# Countdown from 10 seconds
for i in {10..1}; do
  echo "$i"
  sleep 1
  if [ $? -ne 0 ]; then
    echo "Countdown interrupted. No logout."
    exit 0
  fi
done
logout