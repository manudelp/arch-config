#!/bin/bash
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)
players=$(playerctl --list-all 2>/dev/null) # Obtener la lista de reproductores

if [[ -z "$players" ]]; then # Verificar si no hay reproductores
    echo '{"text": ""}' # Devolver una cadena vacía si no hay reproductores
else
    artist=$(playerctl metadata xesam:artist 2>/dev/null) # Obtener el artista
    title=$(playerctl metadata xesam:title 2>/dev/null) # Obtener el título

    if [[ -z "$artist" ]] || [[ -z "$title" ]]; then # Verificar si no hay metadatos
        echo '{"text": ""}' # Devolver una cadena vacía si no hay metadatos
    else
        text="$title - $artist" # Formatear la información
        echo "{\"text\": \"$text\"}" # Devolver la información en formato JSON
    fi
fi
