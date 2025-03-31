#!/bin/bash

# Check if any media player is running
player=$(playerctl -l)

# If no player is found, return an empty string
if [[ -z "$player" ]]; then
    echo '{"text": ""}'
    exit 0
fi

# If a player is found, fetch the metadata
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)

# If either artist or title is empty, return an empty string
if [[ -z "$artist" ]] || [[ -z "$title" ]]; then
    echo '{"text": ""}'
else
    echo "{\"text\": \"$artist - $title \"}"
fi
