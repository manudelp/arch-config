#!/bin/bash
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)
if [[ -z "$artist" ]] || [[ -z "$title" ]]; then
    exit 0
else
    echo "{\"text\": \"$artist - $title \"}"
fi
