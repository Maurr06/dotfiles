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

# ────────────────────────────────────────────────
# 📦 Verificar e instalar yay si no existe
if ! command -v yay &> /dev/null; then
    echo "📥 yay no encontrado. Instalando yay..."
    sudo pacman -S --needed git base-devel --noconfirm
    tempdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tempdir/yay"
    (cd "$tempdir/yay" && makepkg -si --noconfirm)
    rm -rf "$tempdir"
    echo "✅ yay instalado correctamente."
fi

# ────────────────────────────────────────────────
echo "📦 Instalando todos los paquetes desde pkglist.txt..."
yay -S --needed - < pkglist.txt

echo "🔄 Regenerando initramfs y GRUB..."
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "✅ Sistema configurado correctamente. Reiniciá para aplicar todo."
