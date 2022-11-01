
[[ -d $HOME/.autojump/bin ]] && _path_append $HOME/.autojump/bin
[[ -d $HOME/bin ]] && _path_prepend $HOME/bin
[[ -d $HOME/.local/bin ]] && _path_prepend $HOME/.local/bin
[[ -d /snap/bin ]] && _path_append /snap/bin
[[ -d $HOME/go/bin ]] && _path_append $HOME/go/bin

[[ ! -z $_RC_DEBUG ]] && echo "Initialized paths.sh"
