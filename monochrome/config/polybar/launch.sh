#!/usr/bin/env bash

# Mata instâncias existentes
killall -q polybar

# Espera até que todas as instâncias sejam encerradas
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

# Inicia a barra principal (ajuste o nome conforme o seu config)
polybar main -c ~/.config/polybar/config.ini &
