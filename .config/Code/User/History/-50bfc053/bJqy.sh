#!/bin/bash
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)

# Verificar si hay reproductores usando playerctl list
playback_status=$(playerctl status 2>/dev/null)

if [[ -z "$playback_status" ]] || [[ "$playback_status" == "Stopped" ]] || [[ "$playback_status" == "Paused" ]]; then
    echo '{"text": ""}' # No hay reproducción, no mostrar nada
else
    artist=$(playerctl metadata xesam:artist 2>/dev/null)
    title=$(playerctl metadata xesam:title 2>/dev/null)

    if [[ -z "$artist" ]] || [[ -z "$title" ]]; then
        echo '{"text": ""}' # No hay metadatos, no mostrar nada
    else
        echo "{\"text\": \"$title - $artist\"}" # Mostrar metadatos
    fi
fi
