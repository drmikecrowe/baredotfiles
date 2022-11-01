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
