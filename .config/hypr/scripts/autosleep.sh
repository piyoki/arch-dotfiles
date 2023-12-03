#!/bin/bash

icon=system-suspend-symbolic

notify-send -i $icon 'Swayidle' 'autosleep enabled' -t 10000

swayidle -w \
  timeout 360 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  after-resume 'waybar' \
  before-sleep 'pkill waybar' &
