if [[ -n "$GOENV_ROOT" && -x "$GOENV_ROOT/bin/goenv" ]] || [[ -x "$HOME/.goenv/bin/goenv" ]]; then
    if ! _command_exists goenv; then
        # Set GOENV_ROOT, if not already set
    export GOENV_ROOT="${GOENV_ROOT:-$HOME/.goenv}"

    # Add GOENV_ROOT/bin to PATH, if that's where it's installed
    ! _command_exists goenv && [[ -x "$GOENV_ROOT/bin/goenv" ]] && _path_prepend "$GOENV_ROOT/bin"

    # Initialize goenv
    eval "$(goenv init - $CURRENT_SHELL)"
    fi
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized goenv.sh"
