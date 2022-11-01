if [[ -n "$PYENV_ROOT" && -x "$PYENV_ROOT/bin/pyenv" ]] || [[ -x "$HOME/.pyenv/bin/pyenv" ]]; then
    if ! _command_exists pyenv; then
        export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
        _path_prepend "$PYENV_ROOT/bin"
        eval "$(pyenv init -)"
    fi
fi
