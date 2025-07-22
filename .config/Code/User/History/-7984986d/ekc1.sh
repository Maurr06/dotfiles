#!/bin/bash

set -e

echo "📂 Aplicando configuraciones de usuario..."
cp -r .config "$HOME/"
cp -r .local "$HOME/"
cp -r Fondos "$HOME/"
cp .bashrc .zshrc .profile .bash_profile .xprofile .inputrc .pam_environment "$HOME/" 2>/dev/null || true

echo "🔧 Restaurando systemd user units..."
mkdir -p "$HOME/.config/systemd/user"
cp -r config-systemd-user/* "$HOME/.config/systemd/user/" 2>/dev/null || true

echo "💾 Restaurando configuraciones del sistema (requiere sudo)..."
sudo cp etc-default-grub /etc/default/grub
sudo rm -rf /etc/grub.d
sudo cp -r grub.d-backup /etc/grub.d
sudo cp mkinitcpio.conf /etc/mkinitcpio.conf
sudo cp pacman.conf /etc/pacman.conf
sudo rm -rf /etc/systemd/system
sudo cp -r systemd-system /etc/systemd/system

echo "📦 Instalando todos los paquetes (pacman + AUR)..."
if command -v yay &> /dev/null; then
    yay -S --needed - < pkglist.txt
else
    echo "⚠️ yay no encontrado. Instale yay antes de ejecutar este script."
fi

echo "🔄 Regenerando initramfs y GRUB..."
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "✅ Sistema configurado correctamente. Reiniciá para aplicar todo."
