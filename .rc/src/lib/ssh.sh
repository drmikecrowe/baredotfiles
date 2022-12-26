# https://github.com/dyuri/repassh
# alias ssh='$HOME/.local/bin/repassh'
# alias scp='BINARY_SSH=scp $HOME/.local/bin/repassh'
# alias rsync='BINARY_SSH=rsync $HOME/.local/bin/repassh'

if [[ -f $HOME/.1password/agent.sock ]]; then
  export SSH_AUTH_SOCK=$HOME/.1password/agent.sock
else
  eval `ssh-agent`
  [[ -d $HOME/.ssh ]] && [[ $(find $HOME/.ssh | egrep 'id_.*pub' | wc -l) -gt 0 ]] && [[ $(ssh-add -L | wc -l) == 0 ]] && ssh -a $HOME/.ssh/*pub
fi

[[ ! -z $_RC_DEBUG ]] && echo "Initialized pyenv.sh"
