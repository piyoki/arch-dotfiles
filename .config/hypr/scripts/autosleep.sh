#!/bin/bash

icon=/usr/share/icons/Papirus-Dark/symbolic/actions/system-suspend-symbolic.svg

notify-send -i $icon 'Swayidle' 'sleep in 5s'

swayidle -w \
  timeout 360 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  after-resume 'waybar' \
  before-sleep 'pkill waybar' &
