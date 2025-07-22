#!/bin/bash

set -e  # ⛔ Detiene el script si hay algún error

echo "📦 Instalando paquetes desde pkglist.txt..."
if [ -f pkglist.txt ]; then
    sudo pacman -S --needed - < pkglist.txt
else
    echo "⚠️  No se encontró pkglist.txt"
fi

echo "📦 Instalando paquetes AUR desde aur-pkglist.txt..."
if [ -f aur-pkglist.txt ]; then
    yay -S --needed - < aur-pkglist.txt
fi

echo "🧩 Copiando configuraciones..."
mkdir -p ~/.config ~/.local/share/fonts

[ -d .config ] && cp -r .config/* ~/.config/
[ -f .zshrc ] && cp .zshrc ~/
[ -f .bashrc ] && cp .bashrc ~/
[ -d .local_fonts ] && cp -r .local_fonts/* ~/.local/share/fonts/
[ -d .icons ] && cp -r .icons ~/
[ -d .themes ] && cp -r .themes ~/

echo "🔄 Actualizando caché de fuentes..."
fc-cache -fv

echo "✅ Configuración restaurada. Reiniciá sesión o ejecutá 'source ~/.bashrc' / 'source ~/.zshrc'"
