#!/bin/bash

set -e

echo "🧹 Limpiando dotfiles antiguos (menos 'Prestadojeje' y 'actualizar_dotfiles.sh')..."
find . -mindepth 1 -maxdepth 1 ! -name 'Prestadojeje' ! -name 'actualizar_dotfiles.sh' -exec rm -rf {} +

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

echo "✅ Dotfiles actualizados correctamente."
