#!/usr/bin/env bash

check() {
  command -v "$1" &>/dev/null
}

loc="$HOME/.cache/colorpicker"
[ -d "$loc" ] || mkdir -p "$loc"
[ -f "$loc/colors" ] || touch "$loc/colors"

limit=10

# Mostrar lista de colores
if [[ $# -eq 1 && $1 == "-l" ]]; then
  cat "$loc/colors"
  exit
fi

# JSON para Waybar
if [[ $# -eq 1 && $1 == "-j" ]]; then
  text="$(grep -E '^#[0-9A-Fa-f]{6}$' "$loc/colors" | head -n 1)"
  [[ -z "$text" ]] && text="#ffffff"  # Color fallback

  mapfile -t allcolors < <(tail -n +2 "$loc/colors" | grep -E '^#[0-9A-Fa-f]{6}$')
  tooltip="<b>   COLORS</b>\n\n"
  tooltip+="-> <b>$text</b>  <span color='$text'></span>\n"
  for i in "${allcolors[@]}"; do
    tooltip+="   <b>$i</b>  <span color='$i'></span>\n"
  done

  cat <<EOF
{ "text":"<span color='$text'></span>", "tooltip":"$tooltip" }
EOF
  exit
fi

# Selección de color
check hyprpicker || {
  notify-send "Color Picker" "Hyprpicker no está instalado"
  exit 1
}

killall -q hyprpicker
color=$(hyprpicker)
[[ -z "$color" || ! "$color" =~ ^#[0-9A-Fa-f]{6}$ ]] && exit 1

check wl-copy && echo "$color" | wl-copy

# Guardar color en historial (sin duplicados, solo colores válidos)
prevColors=$(grep -E '^#[0-9A-Fa-f]{6}$' "$loc/colors" | grep -v "$color" | head -n $((limit - 1)))
{
  echo "$color"
  echo "$prevColors"
} > "$loc/colors"

# Notificación
source ~/.cache/wal/colors.sh && notify-send "Color Picker" "This color has been selected: $color" -i "$wallpaper"

# Actualizar Waybar
pkill -RTMIN+1 waybar
