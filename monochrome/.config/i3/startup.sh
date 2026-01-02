#!/usr/bin/env bash

# Dev
i3-msg 'workspace dev; exec kitty'
sleep 0.5

# Comms
i3-msg 'workspace comms; exec discord'
sleep 0.5
i3-msg 'workspace comms; exec spotify'
sleep 0.5

# Web
i3-msg 'workspace web; exec brave-browser'
sleep 0.5

# Annotations
i3-msg 'workspace annotations; exec obsidian'
sleep 0.5
i3-msg 'workspace annotations; exec kitty'
