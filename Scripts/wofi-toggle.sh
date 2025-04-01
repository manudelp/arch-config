#!/bin/bash

# Check if wofi is already running
if pgrep -x "wofi" > /dev/null; then
    # Kill the existing wofi process
    pkill wofi
fi

# Start wofi drun again
wofi --show drun
