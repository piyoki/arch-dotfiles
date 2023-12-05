#!/usr/bin/env bash

class="string:x-canonical-private-synchronous:sys-notify"
info_icon="/usr/share/icons/Papirus-Dark/48x48/status/dialog-information.svg"

notify-send -h $class -u low -i $info_icon "Screenshot Capture" "\nSelect a region"
grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- | swappy -f -
