if [[ -d $HOME/.nodenv ]]; then
    if ! _command_exists nodenv; then
        export NODENV_ROOT="$HOME/.nodenv"
        _path_prepend "$NODENV_ROOT/bin"
        eval "$(nodenv init - $SHELL)"
    fi
fi
