#!/bin/bash

set -e

echo "🧹 Limpiando dotfiles antiguos (menos 'Prestadojeje' y 'actualizar_dotfiles.sh')..."
find . -mindepth 1 -maxdepth 1 ! -name 'Prestadojeje' ! -name '.git' ! -name 'actualizar_dotfiles.sh' ! -name 'instalar.sh' -exec sudo rm -rf {} +

echo "📦 Guardando lista de paquetes..."
pacman -Qqe > pkglist.txt
yay -Qqe > aur-pkglist.txt

echo "📂 Copiando toda la carpeta .config..."
rm -rf .config
cp -r ~/.config .config

echo "📂 Copiando toda la carpeta .local..."
rm -rf .local
cp -r ~/.local .local

echo "🖼️ Copiando fondos..."
rm -rf Fondos
cp -r /home/maurod/Fondos Fondos

echo "⚙️ Copiando archivos personales de bash y zsh..."
cp ~/.bashrc ~/.zshrc ~/.profile ~/.bash_profile ~/.xprofile ~/.inputrc ~/.pam_environment ./ 2>/dev/null || true

echo "💾 Copiando configuraciones del sistema (requiere sudo)..."
sudo cp /etc/default/grub ./etc-default-grub
sudo cp -r /etc/grub.d ./grub.d-backup
sudo cp /etc/mkinitcpio.conf ./mkinitcpio.conf
sudo cp /etc/pacman.conf ./pacman.conf
# sudo cp -r /etc/pacman.d/hooks ./pacman-hooks
sudo cp -r /etc/systemd/system ./systemd-system

echo "🔧 Copiando configuraciones de usuario extendidas..."
# cp ~/.xprofile ./
cp ~/.bash_profile ./
cp ~/.zprofile ./
cp -r ~/.config/systemd/user ./config-systemd-user

echo "✅ Dotfiles y configuraciones del sistema actualizadas correctamente."
