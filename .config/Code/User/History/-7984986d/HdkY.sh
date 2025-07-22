#!/usr/bin/env bash
# instalar.sh: Instalación automática e idempotente de dotfiles y configuración

set -euo pipefail
IFS=$'\n\t'

LOGFILE=install.log
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d_%H%M%S)"

# Función de log con timestamp
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOGFILE"
}

# Asegura ejecución con privilegios (re-ejecuta con sudo si es necesario)
require_sudo() {
  if [[ $EUID -ne 0 ]]; then
    log "Elevando privilegios con sudo..."
    exec sudo --preserve-env=HOME "$0" "$@"
  fi
}

# Verifica que estamos en el directorio del script
assert_repo_root() {
  if [[ ! -f instalar.sh ]]; then
    log "ERROR: Ejecuta este script desde la raíz del repositorio donde está instalar.sh"
    exit 1
  fi
}

# Crea un backup de cualquier archivo de usuario que vaya a sobrescribirse
backup_user_configs() {
  log "Creando backup de configuraciones de usuario en $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"
  local items=(.config .local Fondos .bashrc .zshrc .profile .bash_profile .xprofile .inputrc .pam_environment)
  for item in "${items[@]}"; do
    if [[ -e "$HOME/$item" ]]; then
      cp -r "$HOME/$item" "$BACKUP_DIR/" 2>/dev/null || true
      log "  - Respaldado $HOME/$item"
    fi
  done
}

# Restaura configuraciones de usuario
restore_user_configs() {
  log "Restaurando configuraciones de usuario..."
  cp -r .config "$HOME/"
  cp -r .local "$HOME/"
  cp -r Fondos "$HOME/"
  cp .bashrc .zshrc .profile .bash_profile .xprofile .inputrc .pam_environment "$HOME/" 2>/dev/null || true
  log "  - Config. de usuario aplicada"

  log "Restaurando unit files de systemd user..."
  mkdir -p "$HOME/.config/systemd/user"
  cp -r config-systemd-user/* "$HOME/.config/systemd/user/" 2>/dev/null || true
}

# Restaura configuraciones de sistema
restore_system_configs() {
  log "Restaurando configuraciones del sistema..."
  require_sudo
  cp etc-default-grub /etc/default/grub
  rm -rf /etc/grub.d
  cp -r grub.d-backup /etc/grub.d
  cp mkinitcpio.conf /etc/mkinitcpio.conf
  cp pacman.conf /etc/pacman.conf
  rm -rf /etc/systemd/system
  cp -r systemd-system /etc/systemd/system
  log "  - Config. de sistema aplicada"
}

# Instala yay si no existe
install_yay() {
  if ! command -v yay &>/dev/null; then
    log "yay no encontrado: instalando desde AUR..."
    require_sudo
    pacman -S --needed --noconfirm git base-devel
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    pushd "$tmpdir/yay" >/dev/null
    makepkg -si --noconfirm
    popd >/dev/null
    rm -rf "$tmpdir"
    log "  - yay instalado"
  else
    log "yay ya está instalado"
  fi
}

# Instala paquetes desde pkglist.txt
install_packages() {
  log "Instalando paquetes listados en pkglist.txt..."
  require_sudo
  yay -Syu --needed --noconfirm - < pkglist.txt
  log "  - Todos los paquetes instalados"
}

# Regenera initramfs y GRUB
update_boot() {
  log "Regenerando initramfs y configuración de GRUB..."
  require_sudo
  mkinitcpio -P
  grub-mkconfig -o /boot/grub/grub.cfg
  log "  - Initramfs y GRUB actualizados"
}

# Flujo principal
main() {
  assert_repo_root "$@"
  log "=== Inicio de la instalación automática ==="

  backup_user_configs
  restore_user_configs
  restore_system_configs
  install_yay
  install_packages
  update_boot

  log "=== Instalación completada! Reinicia el sistema para aplicar cambios ==="
}

main "$@"
