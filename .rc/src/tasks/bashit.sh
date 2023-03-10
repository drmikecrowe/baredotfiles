# Run with: 'bashing run bashrc'
# <help>Start bash using bash-it</help>

# My default setup for all computers

export BASH_IT=${BASH_IT:-$HOME/.bash_it}

export BASH_IT_THEME=${BASH_IT_THEME:-"powerline-multiline"}

[[ -z $SHORT_USER ]] && export SHORT_USER="$(hostname -s)@${USER:0:8}"
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
#export BASH_IT_LOG_LEVEL=3

source "$BASH_IT"/bash_it.sh

# vi:et:ts=4:sw=4
