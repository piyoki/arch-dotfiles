##
##  | | _______   __           HIKARI AI
##  | |/ / _ \ \ / /           https://hikariai.net
##  |   <  __/\ V /            https://link.hikariai.net
##  |_|\_\___| \_/             https://github.com/yqlbu
##
## My fish shell config. Nothing fancy, but I like it

### PATH ###
fish_add_path $HOME/.linuxbrew/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/scripts

### General Settings ###
set fish_greeting         # Turns off the intro message when pulling up fish shell
set EDITOR "vim"          # Sets the $EDITOR to vim

export CLICOLOR=1
export LS_COLORS=(vivid generate nord)

### Fish Alias ###

abbr fish_config "nvim ~/.config/fish/config.fish"
abbr unset "set --erase"

### Shortcuts ###
abbr ..  "cd .."
abbr ... "cd ../../"
abbr home "cd ~"
abbr vim "nvim"
abbr lg "lazygit"
abbr ra "ranger"
# abbr go_async_run "when-changed -r -v -1 . go run"
# abbr python_async_run "when-changed -r -v -1 . python"
# # programs and system
abbr ls "ls -ltrh"
abbr du "du -d 1 -h"
abbr kill "killall"
# tmux
abbr t "tmux"
# kubernetes related
abbr k "kubectl"
# journalctl
abbr journal "journalctl -xefu"
# brew
abbr brew-cleanup "brew cleanup --prune=all"
# tmux
abbr t "tmux"
# neofetch
abbr logo "neofetch"
# package manager related
abbr pacsyu "pacman -Syu --noconfirm"
alias yay="paru"
# kubernetes related
abbr k "kubectl"

### Device Control ###
# system
abbr sleep "xset dpms force suspend"
# audio
abbr get-audio-out "$HOME/.local/scripts/get-audio-out"
abbr set-audio-out "pactl set-default-sink"
# ddcutil
abbr set-br "sudo ddcutil setvcp 10 --display"
abbr get-br "sudo ddcutil getvcp 10 --display"
abbr dd "sudo ddcutil"
# audio
abbr get-audio-vol "wpctl get-volume @DEFAULT_AUDIO_SINK@"
abbr set-audio-vol "wpctl set-volume @DEFAULT_AUDIO_SINK@"
# pb
alias pb="curl -F 'c=@-' https://fars.ee/"

### Dev ENV ###

# Homebrew env
[ -d $HOME/.linuxbrew ] && eval ($HOME/.linuxbrew/bin/brew shellenv)

# fzf key-remaps
fzf_configure_bindings --git_status --history=\ch --variables=\cv --directory=\cx --git_log=\cg
