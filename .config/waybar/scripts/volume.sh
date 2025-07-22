#!/usr/bin/env bash
volume=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

icon=""
[ "$mute" = "true" ] && icon=""

echo "{ \"text\": \"$icon $volume%\", \"tooltip\": \"Volume: $volume%\" }"
