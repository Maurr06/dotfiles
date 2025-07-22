#!/bin/bash

# Workspace a cambiar (recibido como argumento)
WORKSPACE="$1"

# Cambia en ambos monitores
hyprctl dispatch workspace "$WORKSPACE,DP-1"
hyprctl dispatch workspace "$WORKSPACE,HDMI-A-1"
