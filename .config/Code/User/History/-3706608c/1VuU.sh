#!/bin/bash

set -e

echo "🧹 Limpiando dotfiles antiguos (menos 'Prestadojeje')..."
find . -mindepth 1 -maxdepth 1 ! -name 'Prestadojeje' ! -name 'actualizar_dotfiles.sh' -exec rm -rf {} +

echo "📦 Guardando lista de paquetes..."
pacman -Qqe > pkglist.txt
yay -Qqe > aur-pkglist.txt

echo "📂 Copiando configuración de .config..."
mkdir -p dotfiles/.config
cp -r ~/.config/{hypr,waybar,wofi,kitty,rofi,mako,swaylock,wlogout,nwg-look,xdg-desktop-portal,gtk-3.0,gtk-4.0} dotfiles/.config/ 2>/dev/null || true

echo "📂 Copiando .local/share (solo fonts, themes, icons)..."
mkdir -p dotfiles/.local/share
cp -r ~/.local/share/{fonts,icons,themes} dotfiles/.local/share/ 2>/dev/null || true

echo "🖼️ Copiando fondos..."
mkdir -p dotfiles/Fondos
cp -r /home/maurod/Fondos/* dotfiles/Fondos/ 2>/dev/null || true

echo "⚙️ Copiando archivos personales de bash y zsh..."
cp ~/.bashrc ~/.zshrc ~/.profile ~/.bash_profile ~/.xprofile ~/.inputrc ~/.pam_environment dotfiles/ 2>/dev/null || true

echo "✅ Dotfiles actualizados correctamente."
