#!/usr/bin/env bash

class="string:x-canonical-private-synchronous:sys-notify"
volume_up_icon="/usr/share/icons/Papirus-Dark/48x48/devices/audio-speaker-left-side-testing.svg"
volume_down_icon="/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-medium.svg"
mute_icon="/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-muted.svg"
volume_high_icon="/usr/share/icons/Papirus-Dark/48x48/status/notification-audio-volume-high.svg"

# Get Volume
get_volume() {
  echo "$(pamixer --get-volume)"
}

# Increase Volume
volume_up() {
  pamixer -i 5
  notify-send -h $class -u low -i $volume_up_icon "Volume Up" "Current Volume: $(get_volume) %"
}

# Decrease Volume
volume_down() {
  pamixer -d 5
  notify-send -h $class -u low -i $volume_down_icon "Volume Down" "Current Volume: $(get_volume) %"
}

# Toggle Mute
toggle_mute() {
  if [ "$(pamixer --get-mute)" == "false" ]; then
    pamixer -m
    notify-send -h $class -u low -i $mute_icon "Speaker Volume Mute" "Volume switched off"
  elif [ "$(pamixer --get-mute)" == "true" ]; then
    pamixer -u
    notify-send -h $class -u low -i $volume_high_icon "Speaker Volume Mute" "Volume switched on"
  fi
}

# Toggle Mic
# toggle_mic() {
#   if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
#     pamixer --default-source -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone-mute.png" "Microphone Switched OFF"
#   elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
#     pamixer -u --default-source u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone.png" "Microphone Switched ON"
#   fi
# }

# Get icons
# get_mic_icon() {
#   current=$(pamixer --default-source --get-volume)
#   if [[ "$current" -eq "0" ]]; then
#     echo "$iDIR/microphone.png"
#   elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
#     echo "$iDIR/microphone.png"
#   elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
#     echo "$iDIR/microphone.png"
#   elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
#     echo "$iDIR/microphone.png"
#   fi
# }
# Notify
# notify_mic_user() {
#   notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_mic_icon)" "Mic-Level : $(pamixer --default-source --get-volume) %"
# }

# # Increase MIC Volume
# inc_mic_volume() {
#   pamixer --default-source -i 5 && notify_mic_user
# }

# # Decrease MIC Volume
# dec_mic_volume() {
#   pamixer --default-source -d 5 && notify_mic_user
# }

# Execute accordingly
if [[ "$1" == "--get" ]]; then
  get_volume
elif [[ "$1" == "--inc" ]]; then
  volume_up
elif [[ "$1" == "--dec" ]]; then
  volume_down
elif [[ "$1" == "--mute" ]]; then
  toggle_mute
# elif [[ "$1" == "--toggle-mic" ]]; then
#   toggle_mic
# elif [[ "$1" == "--get-mic-icon" ]]; then
#   get_mic_icon
# elif [[ "$1" == "--mic-inc" ]]; then
#   inc_mic_volume
# elif [[ "$1" == "--mic-dec" ]]; then
#   dec_mic_volume
else
  get_volume
fi
