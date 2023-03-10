export GPG_TTY=$(tty)
export PIPENV_VENV_IN_PROJECT=1

if [ -z $(which lvim) ]; then
    export EDITOR=vim
else
    export EDITOR=lvim
fi
[[ ! -z $_RC_DEBUG ]] && echo "Initialized environment.sh"
    