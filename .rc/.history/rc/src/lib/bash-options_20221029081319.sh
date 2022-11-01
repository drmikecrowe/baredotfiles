if [[ ! -z $BASH_VERSION ]]; then

    [[ ! -z $_RC_DEBUG ]] && echo "Initializing bash-options"

    # rag: expand history but do not execute
    shopt -s histverify

    # If set, minor errors in the spelling of a directory component in a cd command will be corrected
    shopt -s cdspell

    # If set, Bash matches filenames in a case-insensitive fashion when performing filename expansion.
    shopt -s nocaseglob

    # If set, Bash attempts to save all lines of a multiple-line command in the same history entry
    shopt -s cmdhist

fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized bash-options.sh"
