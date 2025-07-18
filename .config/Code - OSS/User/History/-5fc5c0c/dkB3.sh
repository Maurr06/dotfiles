#!/bin/bash

echo "📦 Instalando paquetes desde pkglist.txt..."
sudo pacman -S --needed - < pkglist.txt

echo "🧩 Copiando configuraciones..."
cp -r .config ~/
cp .zshrc ~/
cp .bashrc ~/
cp -r .local_fonts ~/.local/share/fonts/
cp -r .icons ~/
cp -r .themes ~/

echo "✅ Configuración restaurada. Recordá reiniciar sesión."
