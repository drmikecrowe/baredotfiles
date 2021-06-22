source $HOME/.bash/helpers; doOnce && return 0

[[ ":$PATH:" != *":/$HOME/bin:"* ]] && export PATH="/$HOME/bin:$PATH"
[[ ":$PATH:" != *":/$HOME/.local/bin:"* ]] && export PATH="/$HOME/.local/bin:$PATH"
[[ ":$PATH:" != *":/snap/bin:"* ]] && export PATH="/snap/bin:$PATH"

if [[ -d /$HOME/.nodenv ]]; then
    export PATH="/$HOME/.nodenv:$PATH"
    eval "$(nodenv init - bash)"
fi

if [[ -d /$HOME/.pyenv ]]; then
    export PATH="/$HOME/.pyenv:$PATH"
    eval "$(pyenv init - bash)"
fi

if [[ -d /$HOME/.goenv ]]; then
    export PATH="/$HOME/.goenv:$PATH"
    eval "$(goenv init - bash)"
fi

if [ -d /home/linuxbrew/.linuxbrew ]; then
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
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
    export BASH_IT_LOG_LEVEL=3
    source "$BASH_IT"/bash_it.sh
    if [ -f ~/.agent.env ] ; then
        . ~/.agent.env > /dev/null
        if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
            echo "Stale agent file found. Spawning new agent… "
            eval `ssh-agent | tee ~/.agent.env`
            ssh-add-all
        fi
    else
        echo "Starting ssh-agent"
        eval `ssh-agent -s | tee ~/.agent.env`
        ssh-add-all
    fi

fi

