[[ ":$PATH:" != *":/$HOME/bin:"* ]] && export PATH="/$HOME/bin:$PATH"
[[ ":$PATH:" != *":/$HOME/.local/bin:"* ]] && export PATH="/$HOME/.local/bin:$PATH"
[[ ":$PATH:" != *":/snap/bin:"* ]] && export PATH="/snap/bin:$PATH"

[[ ":$PATH:" != *":/$HOME/.nodenv:"* ]] && export PATH="/$HOME/.nodenv:$PATH"
[[ `which nodenv` ]] && eval "$(nodenv init - bash)"

[[ ":$PATH:" != *":/$HOME/.pyenv:"* ]] && export PATH="/$HOME/.pyenv:$PATH"
[[ `which pyenv` ]] && eval "$(pyenv init - bash)"

[[ ":$PATH:" != *":/$HOME/.goenv:"* ]] && export PATH="/$HOME/.goenv:$PATH"
[[ `which goenv` ]] && eval "$(goenv init - bash)"

export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
if [ -d $HOMEBREW_CELLAR ]; then
    export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
    export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info${INFOPATH+:$INFOPATH}"
fi

export BASH_IT="$HOME/.bash_it"
if [ -d $BASH_ID ]; then
    export BASH_IT_THEME='powerline-multiline'
    # export GIT_HOSTING='git@git.domain.com'
    unset MAILCHECK
    export IRC_CLIENT='irssi'
    export TODO="t"
    export SCM_CHECK=true
    export SHORT_HOSTNAME=$(hostname -s)
    export SHORT_USER=${USER:0:8}
    export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
    source "$BASH_IT"/bash_it.sh
    ssh-add-all
fi

