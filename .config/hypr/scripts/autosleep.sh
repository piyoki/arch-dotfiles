#!/bin/bash

sleep_icon="/usr/share/icons/Papirus-Dark/48x48/status/state_shutoff.svg"

notify-send -i $icon 'Swayidle' '\nAutosleep enabled'

swayidle -w \
  timeout 360 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  after-resume 'waybar' \
  before-sleep 'pkill waybar' &
