#!/usr/bin/env bash

# Name of the Flatpak application
FLATPAK_APP="com.plexamp.Plexamp"

# Check if the app is currently running
if flatpak ps --columns=application | grep -q "^${FLATPAK_APP}$"; then
    # If it's running then kill it
    flatpak kill "$FLATPAK_APP"
else
    # If it's Not running then start it
    flatpak run "$FLATPAK_APP"
fi