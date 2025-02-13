
function __complete_minio-mc
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /home/alltilla/.local/bin/minio-mc
end
complete -f -c minio-mc -a "(__complete_minio-mc)"

