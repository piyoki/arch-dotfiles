##
##  | | _______   __           HIKARI AI
##  | |/ / _ \ \ / /           https://hikariai.net
##  |   <  __/\ V /            https://link.hikariai.net
##  |_|\_\___| \_/             https://github.com/yqlbu
##
## My fish shell config. Nothing fancy, but I like it

### PATH ###
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.npm-global/bin
fish_add_path $HOME/.local/scripts
fish_add_path $HOME/go/bin
fish_add_path $HOME/.nix-profile/bin

### Link Sources ###
source $HOME/.config/fish/themes/cool-beans.fish
source $HOME/.config/fish/functions/bangbang.fish
source $HOME/.config/fish/gnupg.fish

### General Settings ###
set fish_greeting # Turns off the intro message when pulling up fish shell
set EDITOR "nvim" # Sets the $EDITOR to vim

export CLICOLOR=1
export LS_COLORS=(vivid generate nord)

export SOPS_PGP_FP="B08FE2644F9FC450AF425FF5B94F394B72884017"
export SOPS_AGE_RECIPIENTS=(cat $HOME/.age/age.pub)
export SOPS_AGE_KEY_FILE=$HOME/.age/age.key

### Fish Alias ###
abbr unset "set --erase"

### Shortcuts ###
abbr ..  "cd .."
abbr ... "cd ../../"
abbr home "cd ~"
abbr vim "nvim"
abbr lg "lazygit"
abbr ld "lazydocker"
abbr ra "ranger"
abbr edit "notepadqq"
abbr top "btop"
abbr weather "curl wttr.in/"
# abbr lf "lfrun"
# abbr go_async_run "when-changed -r -v -1 . go run"
# abbr python_async_run "when-changed -r -v -1 . python"
# # programs and system
abbr ls "ls -ltrh"
abbr du "du -d 1 -h"
abbr kill "killall"
abbr rm "trash -v"
# tmux
abbr t "tmux"
# kubernetes related
abbr k "kubectl"
abbr kz "kubectl kustomize"
# journalctl
abbr journal "journalctl -xefu"
# tmux
abbr t "tmux"
# neofetch
abbr logo "neofetch"
# package manager related
abbr pacsyu "sudo pacman -Syyu --noconfirm"
abbr yaysyu "paru -Syyu --noconfirm"
alias yay="paru"
# kubernetes related
abbr k "kubectl"
# git related
abbr gs "git status"
abbr gc "git checkout"
abbr gp "git pull"
abbr gpp "git push -u origin "
abbr gpu "git push -u upstream "
abbr gf "git fetch origin --prune"
abbr gfu "git fetch upstream --prune"
abbr gl "git log --all --decorate --oneline --graph"
abbr gcc "git fetch -p && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D"
abbr gcb "git checkout -b"
abbr gd "git diff"
abbr ys "yadm status"
abbr yadd "yadm add"
abbr ycm "yadm commit -m"
abbr yp "yadm pull"
abbr ypp "yadm push"

# flux
abbr fra "flux reconcile kustomization flux-system --with-source"
abbr fga "flux get all -A"

# ripgrep
abbr rgf "rg --files | rg"

# program
alias vlc "org.videolan.VLC"
abbr icat "viu"

### Device Control ###
# system
abbr sleep "$HOME/.local/scripts/sleep"
# audio
abbr get-audio-out "$HOME/.local/scripts/get-audio-out"
abbr set-audio-out "pactl set-default-sink"
# ddcutil
abbr set-br "sudo ddcutil setvcp 10 --display"
abbr get-br "sudo ddcutil getvcp 10 --display"
abbr dd "sudo ddcutil"
# audio (wirepulmer)
abbr get-vol "wpctl get-volume @DEFAULT_AUDIO_SINK@"
abbr set-vol "wpctl set-volume @DEFAULT_AUDIO_SINK@"
# audio (pamixer)
# abbr get-vol "pamixer --get-volume"
# abbr set-vol "pamixer --set-volume"
# pb
alias pb="curl -F 'c=@-' https://fars.ee/"
# snips
alias snips="ssh snips.sh"
# streamdeck
alias streamdeck="$HOME/.virtualenvs/streamdeck/bin/streamdeck"

### Dev ENV ###

# fzf key-remaps
fzf_configure_bindings --git_status --history=\ch --variables=\cv --directory=\cx --git_log=\cg

# lf history work-dir
bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'

# zoxide
zoxide init fish | source

# atuin
atuin init fish --disable-up-arrow | source
bind \cr _atuin_search
