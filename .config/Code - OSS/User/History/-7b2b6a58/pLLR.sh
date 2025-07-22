#!/usr/bin/env zsh

STATE_FILE="/tmp/hyprland_saved_windows"

if [[ -f "$STATE_FILE" ]]; then
    # Restaurar ventanas
    while IFS='|' read -r wid ws; do
        hyprctl dispatch movetoworkspacesilent "$ws,$wid"
    done < "$STATE_FILE"

    rm "$STATE_FILE"
else
    # Crear o limpiar archivo
    > "$STATE_FILE"

    # Obtener todas las ventanas visibles
    for wid in ${(f)"$(hyprctl clients | grep 'windowAddress' | awk '{print $2}')"}; do
        ws=$(hyprctl clients -j | jq -r ".[] | select(.address == \"$wid\") | .workspace.id")
        echo "$wid|$ws" >> "$STATE_FILE"
        hyprctl dispatch movetoworkspacesilent "999,$wid"
    done
fi
