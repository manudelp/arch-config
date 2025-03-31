#!/bin/bash
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)
if [[ -z "$artist" ]] || [[ -z "$title" ]]; then
    echo '{"text": "No music playing"}'
else
    echo "{\"text\": \"$artist - $title \"}"
fi
