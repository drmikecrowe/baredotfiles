# Run with: 'bashing run bashrc'

# My default setup for all computers

export BASH_IT=${BASH_IT:-$HOME/.bash_it}

if [ "$(which starship)" != "" ]; then
	export BASH_IT_THEME='starship'
	export SCM_CHECK=true
else
	export BASH_IT_THEME='powerline'
	export SCM_CHECK=false
fi
export BASH_IT_THEME='powerline'
[[ -z $SHORT_USER ]] && export SHORT_USER="$(hostname -s)@${USER:0:8}"
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
#export BASH_IT_LOG_LEVEL=3
source "$BASH_IT"/bash_it.sh

[[ -d $HOME/.ssh ]] && [[ $(find $HOME/.ssh | egrep 'id_.*pub' | wc -l) -gt 0 ]] && [[ $(ssh-add -L | wc -l) == 0 ]] && ssh-add-all

# vi:et:ts=4:sw=4
