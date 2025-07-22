#!/bin/bash

set -e

REPO_URL="https://github.com/tu_usuario/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

echo "📥 Clonando o actualizando repo dotfiles..."
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    cd "$DOTFILES_DIR"
    git pull
fi

cd "$DOTFILES_DIR"

echo "📂 Copiando configuraciones de usuario..."
cp -r .config "$HOME/"
cp -r .local "$HOME/"
cp -r Fondos "$HOME/"
cp .bashrc .zshrc .profile .bash_profile .xprofile .inputrc .pam_environment "$HOME/" 2>/dev/null || true
cp -r config-systemd-user "$HOME/.config/systemd/user/" 2>/dev/null || true

echo "💾 Restaurando configuraciones del sistema (requiere sudo)..."
sudo cp etc-default-grub /etc/default/grub
sudo rm -rf /etc/grub.d
sudo cp -r grub.d-backup /etc/grub.d
sudo cp mkinitcpio.conf /etc/mkinitcpio.conf
sudo cp pacman.conf /etc/pacman.conf
sudo rm -rf /etc/pacman.d/hooks
sudo cp -r pacman-hooks /etc/pacman.d/hooks
sudo rm -rf /etc/systemd/system
sudo cp -r systemd-system /etc/systemd/system

echo "📦 Instalando paquetes de pacman..."
sudo pacman -Syu --needed - < pkglist.txt

echo "📦 Instalando paquetes AUR (si yay está instalado)..."
if command -v yay &> /dev/null; then
    yay -S --needed - < aur-pkglist.txt
else
    echo "⚠️ yay no está instalado, no se instalan paquetes AUR."
fi

echo "🔄 Regenerando initramfs e actualizando GRUB..."
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "✅ Instalación y configuración terminada. Reiniciá para aplicar cambios."
