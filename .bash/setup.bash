# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"
export BASH_IT_THEME='bobby'
# export GIT_HOSTING='git@git.domain.com'
unset MAILCHECK
export IRC_CLIENT='irssi'
export TODO="t"
export SCM_CHECK=true
export SHORT_HOSTNAME=$(hostname -s)
export SHORT_USER=${USER:0:8}
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
source "$BASH_IT"/bash_it.sh

# This has to be done post bash_it
if [ -r /home/linuxbrew/.linuxbrew/opt/mcfly/mcfly.bash ]; then
    if [ "$HOMEBREW_PREFIX" == "" ]; then
        export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
        export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
        export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
        export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"
        export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"
        export INFOPATH="/home/linuxbrew/.linuxbrew/share/info${INFOPATH+:$INFOPATH}"
    fi
    . /home/linuxbrew/.linuxbrew/opt/mcfly/mcfly.bash
fi
