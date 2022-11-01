if [[ -n "$JENV_ROOT" && -x "$JENV_ROOT/bin/jenv" ]] || [[ -x "$HOME/.jenv/bin/jenv" ]]; then
    if ! _command_exists jenv; then
        # Set JENV_ROOT, if not already set
        export JENV_ROOT="${JENV_ROOT:-$HOME/.jenv}"

        # Add JENV_ROOT/bin to PATH, if that's where it's installed
        ! _command_exists jenv && [[ -x "$JENV_ROOT/bin/jenv" ]] && _path_prepend "$JENV_ROOT/bin"

        # Initialize jenv
        eval "$(jenv init - $CURRENT_SHELL)"
    fi
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized jenv.sh"
