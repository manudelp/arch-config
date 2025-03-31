#!/bin/bash
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)

# Verificar si hay reproductores usando playerctl list
players=$(playerctl list 2>/dev/null)

if [[ -z "$players" ]]; then
    echo '{"text": ""}' # No hay reproductores, no mostrar nada
else
    # Verificar si Spotify está entre los reproductores
    if [[ "$players" == *"spotify"* ]]; then
        artist=$(playerctl metadata xesam:artist 2>/dev/null)
        title=$(playerctl metadata xesam:title 2>/dev/null)

        if [[ -z "$artist" ]] || [[ -z "$title" ]]; then
            echo '{"text": ""}' # No hay metadatos, no mostrar nada
        else
            echo "{\"text\": \"$title - $artist\"}" # Mostrar metadatos
        fi
    else
        echo '{"text": ""}' # Spotify no está en ejecución, no mostrar nada
    fi
fi

