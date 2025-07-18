#!/bin/sh

get_option() {
  hyprctl getoption decoration:"$1" | awk 'NR==1{print $2}'
}

set_option() {
  hyprctl --batch "\
    keyword decoration:active_opacity $1;\
    keyword decoration:inactive_opacity $1"
  exit
}

toggle_blur() {
  hyprctl "keyword decoration:blur:enabled $1"
}

active_opacity=$(get_option active_opacity)
inactive_opacity=$(get_option inactive_opacity)
blur_enabled=$(hyprctl getoption decoration:blur:enabled | awk 'NR==2{print $2}')

if [ "$active_opacity" = "1.000000" ] && [ "$inactive_opacity" = "1.000000" ]; then
  [ "$blur_enabled" = "true" ] && toggle_blur no
  set_option 0
else
  [ "$blur_enabled" = "true" ] && toggle_blur yes
  set_option 1
fi