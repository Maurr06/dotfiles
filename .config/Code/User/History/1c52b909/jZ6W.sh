#!/bin/zsh

volume=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

if [ "$mute" = "true" ]; then
  icon="󰝟"
else
  if [ "$volume" -ge 70 ]; then
    icon="󰕾"
  elif [ "$volume" -ge 30 ]; then
    icon="󰖀"
  else
    icon="󰕿"
  fi
fi

echo "{\"text\":\"$volume%\", \"alt\":\"$volume\", \"class\":\"volume\", \"tooltip\":\"Volumen: $volume%\", \"icon\":\"$icon\"}"
