#!/bin/bash
# yay -S hyprlock pywal
wal -i $BG_IMAGE
sudo cp -a ~/Dotfiles/.config/wal ~/.config/
sudo cp -a ~/Dotfiles/.config/hypr/hyprlock.conf ~/.config/hypr/
