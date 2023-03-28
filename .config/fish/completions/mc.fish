
function __complete_mc
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /home/kev/.linuxbrew/Cellar/mc/RELEASE.2023-02-28T00-12-59Z_1/bin/mc
end
complete -f -c mc -a "(__complete_mc)"

