#!/bin/bash
set -e

echo "💾 Guardando configuraciones del sistema..."

sudo cp /etc/default/grub ./etc-default-grub
sudo cp -r /etc/grub.d ./grub.d-backup
sudo cp /etc/mkinitcpio.conf ./mkinitcpio.conf
sudo cp /etc/pacman.conf ./pacman.conf
sudo cp -r /etc/pacman.d/hooks ./pacman-hooks
sudo cp -r /etc/systemd/system ./systemd-system

# Config de usuario extendida
cp ~/.xprofile ./
cp ~/.bash_profile ./
cp ~/.zprofile ./
cp -r ~/.config/systemd/user ./config-systemd-user

echo "✅ Configuraciones del sistema guardadas."
