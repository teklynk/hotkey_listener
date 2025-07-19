#!/bin/bash

CONTAINER_NAME="open-webui"
URL="http://localhost:3000"

if docker inspect --type container -f '{{.State.Status}}' "$CONTAINER_NAME" | grep -q "running"; then
  echo "Stopping $CONTAINER_NAME..."
  docker stop "$CONTAINER_NAME"
  notify-send "Stopping $CONTAINER_NAME"
  exit 1
else
  echo "Starting $CONTAINER_NAME..."
  docker start "$CONTAINER_NAME"
  notify-send "Starting $CONTAINER_NAME"
  nohup xdg-open "$URL" &> /dev/null &
  exit 0
fi