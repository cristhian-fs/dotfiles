#!/bin/bash

# Script to integrate Appimage to system
APPIMAGE_PATH="$1"
APP_NAME="$2"

if [ -z "$APPIMAGE_PATH" ] || [ -z "$APP_NAME" ]; then
  echo "Use: $0 /path/to/app.AppImage  app-name"
  exit 1
fi

# Dir
APPS_DIR="$HOME/.local/share/applications"
ICONS_DIR="$HOME/.local/share/icons"
APPIMAGES_DIR="$HOME/Applications"

# Criar diretórios
mkdir -p "$APPS_DIR" "$ICONS_DIR" "$APPIMAGES_DIR"

# Copiar AppImage
cp "$APPIMAGE_PATH" "$APPIMAGES_DIR/"
chmod +x "$APPIMAGES_DIR/$(basename $APPIMAGE_PATH)"

# Extrair para obter ícone
cd /tmp
"$APPIMAGE_PATH" --appimage-extract >/dev/null 2>&1

# Encontrar ícone
ICON_FILE=$(find squashfs-root -name "*.png" -o -name "*.svg" | head -n 1)
if [ -n "$ICON_FILE" ]; then
  cp "$ICON_FILE" "$ICONS_DIR/${APP_NAME}.${ICON_FILE##*.}"
  ICON_PATH="$ICONS_DIR/${APP_NAME}.${ICON_FILE##*.}"
else
  ICON_PATH="application-x-executable"
fi

# Criar arquivo .desktop
cat >"$APPS_DIR/${APP_NAME}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=$APP_NAME
Exec=$APPIMAGES_DIR/$(basename $APPIMAGE_PATH)
Icon=$ICON_PATH
Categories=Utility;
Terminal=false
StartupNotify=true
EOF

# Limpar
rm -rf squashfs-root

# Atualizar cache
update-desktop-database "$APPS_DIR" 2>/dev/null

echo "AppImage integrado com sucesso!"
echo "Arquivo: $APPIMAGES_DIR/$(basename $APPIMAGE_PATH)"
echo "Entrada no menu: $APPS_DIR/${APP_NAME}.desktop"
