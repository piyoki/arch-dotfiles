#!/usr/bin/env bash

class="string:x-canonical-private-synchronous:sys-notify"
media_icon="/usr/share/icons/Papirus-Dark/48x48/devices/media-tape.svg"

get_status() {
  echo "$(playerctl status)"
}

get_metadata() {
  meta=$(playerctl metadata)
  artist=$(echo "${meta}" | rg artist | awk -F 'xesam:artist' '{print $2}' | awk '{$1=$1;print}')
  title=$(echo "${meta}" | rg title | awk -F 'xesam:title' '{print $2}' | awk '{$1=$1;print}')
  echo -e "Artist: ${artist}\nTitle: ${title}"
}

# Toggle Play
toggle_pause() {
  if [ "$(playerctl status)" == "Playing" ]; then
    playerctl pause
    notify-send -h $class -u low -i $media_icon "Player Paused" "\n$(get_metadata)"
  elif [ "$(pamixer status)" != "Playing" ]; then
    playerctl play
    notify-send -h $class -u low -i $media_icon "Player Resumed" "\n$(get_metadata)"
  fi
}

# Execute accordingly
if [[ "$1" == "--pause" ]]; then
  toggle_pause
else
  get_status
fi
