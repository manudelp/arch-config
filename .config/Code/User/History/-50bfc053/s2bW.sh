#!/bin/bash

# Check if a player is running
if ! playerctl -l | grep -q .; then
    # No player found
    echo '{"text": ""}'
    exit 0
fi

# Get the current artist and title
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)

# If artist or title is missing, display an empty text
if [[ -z "$artist" ]] || [[ -z "$title" ]]; then
    echo '{"text": ""}'
else
    echo "{\"text\": \"$artist - $title \"}"
fi
