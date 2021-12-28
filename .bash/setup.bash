# My default setup for all computers

export BASH_IT="$HOME/.bash_it"

if [ -d $BASH_IT ]; then
    if [ "$(which starship)" != "" ]; then
        export BASH_IT_THEME='starship'
    else
        export BASH_IT_THEME='powerline-multiline'
    fi
    unset MAILCHECK
    export IRC_CLIENT='irssi'
    export TODO="t"
    export SCM_CHECK=true
    export SHORT_HOSTNAME=$(hostname -s)
    export SHORT_USER=${USER:0:8}
    export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
    #export BASH_IT_LOG_LEVEL=3
    source "$BASH_IT"/bash_it.sh
    [[ $(ssh-add -L | wc -l) == 0 ]] && ssh-add-all

    pathmunge $HOME/bin
    pathmunge $HOME/.local/bin
    [[ -d /snap/bin ]] && pathmunge /snap/bin after
    [[ -d $HOME/go/bin ]] && pathmunge $HOME/go/bin after
fi

