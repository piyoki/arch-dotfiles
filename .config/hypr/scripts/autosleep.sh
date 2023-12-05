#!/bin/bash

enable_icon="/usr/share/icons/Papirus-Dark/48x48/status/state_running.svg"

notify-send -i $enable_icon 'Swayidle' '\nAutosleep enabled'

swayidle -w \
  timeout 360 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  after-resume 'waybar' \
  before-sleep 'pkill waybar' &
