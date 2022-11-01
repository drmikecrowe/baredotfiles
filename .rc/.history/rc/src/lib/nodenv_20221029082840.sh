if [[ -d $HOME/.nodenv ]]; then
    if ! _command_exists nodenv; then
        export NODENV_ROOT="$HOME/.nodenv"
        _path_prepend "$NODENV_ROOT/bin"
        eval "$(nodenv init - $CURRENT_SHELL)"
    fi
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized nodenv.sh"
