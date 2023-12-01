#!/bin/bash

swayidle -w timeout 300 'swaylock' \
  timeout 360 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  after-resume 'waybar' \
  before-sleep 'pkill waybar && swaylock' &
