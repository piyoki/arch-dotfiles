#!/usr/bin/env bash

class="string:x-canonical-private-synchronous:sys-notify"

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
    notify-send -h $class -u low -i media-tape "Player Paused" "\n$(get_metadata)" -t 10000
  elif [ "$(pamixer status)" != "Playing" ]; then
    playerctl play
    notify-send -h $class -u low -i media-tape "Player Resumed" "\n$(get_metadata)" -t 10000
  fi
}

# Execute accordingly
if [[ "$1" == "--pause" ]]; then
  toggle_pause
else
  get_status
fi
