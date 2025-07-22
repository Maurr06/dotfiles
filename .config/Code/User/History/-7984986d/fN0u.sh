#!/bin/bash

set -e

echo "🛠️ Iniciando instalación automática del sistema..."

# 1. ───────────────────────────
echo "📂 Aplicando configuraciones de usuario..."
cp -r .config "$HOME/"
cp -r .local "$HOME/"
cp -r Fondos "$HOME/"
cp .bashrc .zshrc .profile .bash_profile .xprofile .inputrc .pam_environment "$HOME/" 2>/dev/null || true

echo "🔧 Restaurando systemd user units..."
mkdir -p "$HOME/.config/systemd/user"
cp -r config-systemd-user/* "$HOME/.config/systemd/user/" 2>/dev/null || true

# 2. ───────────────────────────
echo "💾 Restaurando configuraciones del sistema (requiere sudo)..."
sudo cp etc-default-grub /etc/default/grub
sudo rm -rf /etc/grub.d
sudo cp -r grub.d-backup /etc/grub.d
sudo cp mkinitcpio.conf /etc/mkinitcpio.conf
sudo cp pacman.conf /etc/pacman.conf
sudo rm -rf /etc/systemd/system
sudo cp -r systemd-system /etc/systemd/system

# 3. ───────────────────────────
echo "📥 Verificando si yay está instalado..."
if ! command -v yay &>/dev/null; then
    echo "📦 yay no encontrado. Instalando yay desde AUR..."

    sudo pacman -S --needed git base-devel --noconfirm

    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    cd "$tmpdir/yay"
    makepkg -si --noconfirm
    cd -
    rm -rf "$tmpdir"

    echo "✅ yay instalado correctamente."
else
    echo "✅ yay ya está instalado."
fi

# 4. ───────────────────────────
echo "📦 Instalando todos los paquetes listados en pkglist.txt..."
yay -Syu --needed --noconfirm - < pkglist.txt

# 5. ───────────────────────────
echo "🔄 Regenerando initramfs y GRUB..."
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg

# 6. ───────────────────────────
echo "✅ Todo listo. Reiniciá el sistema para aplicar los cambios."
