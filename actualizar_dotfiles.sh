#!/bin/bash

set -e

echo "🧹 Limpiando dotfiles antiguos (excepto scripts y backups)..."
find . -mindepth 1 -maxdepth 1 \
  ! -name 'Prestadojeje' \
  ! -name '.git' \
  ! -name 'actualizar_dotfiles.sh' \
  ! -name 'instalar.sh' \
  -exec sudo rm -rf {} +

echo "📦 Guardando lista de paquetes (pacman + AUR)..."
yay -Qqe > pkglist.txt

echo "📂 Copiando carpeta .config..."
rm -rf .config
cp -r "$HOME/.config" .config

echo "📂 Copiando carpeta .local..."
rm -rf .local
cp -r "$HOME/.local" .local

echo "🖼️ Copiando fondos..."
rm -rf Fondos
cp -r "$HOME/Fondos" Fondos

echo "⚙️ Copiando archivos personales..."
cp "$HOME"/.{bashrc,zshrc,profile,bash_profile,xprofile,inputrc,pam_environment} ./ 2>/dev/null || true

echo "💾 Copiando configuraciones del sistema (requiere sudo)..."
sudo cp /etc/default/grub ./etc-default-grub
sudo cp -r /etc/grub.d ./grub.d-backup
sudo cp /etc/mkinitcpio.conf ./mkinitcpio.conf
sudo cp /etc/pacman.conf ./pacman.conf
sudo cp -r /etc/systemd/system ./systemd-system

echo "🔧 Copiando systemd user units..."
mkdir -p config-systemd-user
cp -r "$HOME/.config/systemd/user" ./config-systemd-user 2>/dev/null || true

echo "✅ Dotfiles y configuración actualizada."
