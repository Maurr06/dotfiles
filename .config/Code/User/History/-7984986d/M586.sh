#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# Variables
DOTFILES_DIR="$HOME/maurod"  # La ruta donde el usuario clonará el repo
PKGLIST="$DOTFILES_DIR/pkglist.txt"
YAY_BUILD_DIR="/tmp/yay-build-dir"

log() { echo -e "🛠️ $*"; }
error() { echo -e "❌ ERROR: $*" >&2; exit 1; }

check_command() {
    command -v "$1" >/dev/null 2>&1 || return 1
}

install_yay() {
    if check_command yay; then
        log "yay ya está instalado."
        return 0
    fi
    log "yay no encontrado. Instalando yay desde AUR..."

    sudo pacman -S --needed --noconfirm git base-devel || error "Fallo instalar dependencias base para yay"

    rm -rf "$YAY_BUILD_DIR"
    mkdir -p "$YAY_BUILD_DIR"
    git clone https://aur.archlinux.org/yay.git "$YAY_BUILD_DIR" || error "No se pudo clonar yay"
    cd "$YAY_BUILD_DIR"
    makepkg -si --noconfirm || error "Fallo construir e instalar yay"
    cd - >/dev/null
    rm -rf "$YAY_BUILD_DIR"

    log "yay instalado correctamente."
}

copy_user_files() {
    log "Aplicando configuraciones de usuario..."

    # Copiar .config, .local y Fondos
    cp -r "$DOTFILES_DIR/.config" "$HOME/"
    cp -r "$DOTFILES_DIR/.local" "$HOME/"
    cp -r "$DOTFILES_DIR/Fondos" "$HOME/"

    # Archivos sueltos, ignorar si no existen
    for f in .bashrc .zshrc .profile .bash_profile .xprofile .inputrc .pam_environment; do
        if [ -f "$DOTFILES_DIR/$f" ]; then
            cp "$DOTFILES_DIR/$f" "$HOME/"
        fi
    done

    log "Restaurando systemd user units..."
    mkdir -p "$HOME/.config/systemd/user"
    cp -r "$DOTFILES_DIR/config-systemd-user/"* "$HOME/.config/systemd/user/" 2>/dev/null || true
}

copy_system_files() {
    log "Restaurando configuraciones del sistema (requiere sudo)..."

    sudo cp "$DOTFILES_DIR/etc-default-grub" /etc/default/grub
    sudo rm -rf /etc/grub.d
    sudo cp -r "$DOTFILES_DIR/grub.d-backup" /etc/grub.d
    sudo cp "$DOTFILES_DIR/mkinitcpio.conf" /etc/mkinitcpio.conf
    sudo cp "$DOTFILES_DIR/pacman.conf" /etc/pacman.conf

    sudo rm -rf /etc/systemd/system
    sudo cp -r "$DOTFILES_DIR/systemd-system" /etc/systemd/system
}

install_packages() {
    if [ ! -f "$PKGLIST" ]; then
        error "Archivo pkglist.txt no encontrado en $PKGLIST"
    fi

    log "Sincronizando bases de datos y actualizando sistema..."
    sudo pacman -Syu --noconfirm || error "Fallo actualización pacman"

    log "Instalando paquetes listados en pkglist.txt..."
    yay -S --needed --noconfirm - < "$PKGLIST" || error "Fallo instalar paquetes con yay"
}

regenerate_system() {
    log "Regenerando initramfs y actualizando GRUB..."
    sudo mkinitcpio -P || error "Fallo regenerar initramfs"
    sudo grub-mkconfig -o /boot/grub/grub.cfg || error "Fallo actualizar grub.cfg"
}

print_summary() {
    log "✅ Instalación finalizada con éxito."
    echo -e "\n👉 Reinicia el sistema para aplicar todos los cambios.\n"
}

main() {
    log "Iniciando proceso de instalación automática..."

    # Comprobar que estamos en la carpeta dotfiles
    if [ ! -d "$DOTFILES_DIR/.git" ]; then
        error "No se encontró el repositorio git en $DOTFILES_DIR. Clona primero tu repo."
    fi

    # Verificar sudo
    if ! sudo -v; then
        error "Este script requiere privilegios sudo."
    fi

    install_yay
    copy_user_files
    copy_system_files
    install_packages
    regenerate_system
    print_summary
}

main "$@"
