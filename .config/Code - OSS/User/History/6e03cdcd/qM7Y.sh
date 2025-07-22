#!/bin/zsh

# Check if waybar is running
if pgrep -x "waybar" > /dev/null; then
    # If running, kill the waybar process
    pkill -x "waybar"
else
    # If not running, start waybar
    wal -i $BG_IMAGE
    cp -a ~/Dotfiles/.config/waybar ~/.config/
    waybar &
fi


