# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"
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

