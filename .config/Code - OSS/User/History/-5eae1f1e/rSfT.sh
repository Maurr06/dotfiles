#!/bin/zsh

while true; do
  hour=$(date +%H)
  if (( hour >= 20 || hour < 6 )); then
    hyprctl hyprsunset temperature 1000
  else
    hyprctl hyprsunset identity
  fi
  sleep 300  # chequea cada 5 minutos
done
