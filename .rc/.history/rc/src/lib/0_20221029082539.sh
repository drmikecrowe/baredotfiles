export CURRENT_SHELL=$(basename $(echo $0))

sourceFiles() {
    if [ -d $1 ]; then
        find $1 -maxdepth 1 -type f -print | egrep '\.sh$|\.bash$|.zsh$' | while read FILE; do
            source $FILE
        done
    fi
}

_command_exists() {
    command -v $1 >/dev/null
}
_path_prepend() {
    if [ -n "$2" ]; then
        case ":$(eval "echo \$$1"):" in
            *":$2:"*) :;;
            *) eval "export $1=$2\${$1:+\":\$$1\"}" ;;
        esac
    else
        case ":$PATH:" in
            *":$1:"*) :;;
            *) export PATH="$1${PATH:+":$PATH"}" ;;
        esac
    fi
}

_path_append() {
    if [ -n "$2" ]; then
        case ":$(eval "echo \$$1"):" in
            *":$2:"*) :;;
            *) eval "export $1=\${$1:+\"\$$1:\"}$2" ;;
        esac
    else
        case ":$PATH:" in
            *":$1:"*) :;;
            *) export PATH="${PATH:+"$PATH:"}$1" ;;
        esac
    fi
}

[[ ! -z $_RC_DEBUG ]] && echo "Setting CURRENT_SHELL=$CURRENT_SHELL"
