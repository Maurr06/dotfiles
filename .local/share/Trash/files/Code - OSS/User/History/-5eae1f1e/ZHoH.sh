#!/bin/zsh

# Lanzar hyprsunset si no está corriendo
if ! pgrep -x hyprsunset >/dev/null; then
  hyprsunset &
fi

# Esperar que el socket exista (máx 10 seg)
SOCK_PATH="/run/user/$(id -u)/hypr/*/.hyprsunset.sock"
timeout=10
while [[ ! $(ls $SOCK_PATH 2>/dev/null) && $timeout -gt 0 ]]; do
  sleep 1
  ((timeout--))
done

# Loop para cambiar temperatura según hora
while true; do
  hour=$(date +%H)
  if (( hour >= 20 || hour < 6 )); then
    hyprctl hyprsunset temperature 1000
  else
    hyprctl hyprsunset identity
  fi
  sleep 300
done
